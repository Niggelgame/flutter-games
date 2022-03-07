import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:games/games/uno/game/states/player_state.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/flame/components/single_card.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';

class OwnHandComponent extends PositionComponent
    with HasGameRef<UnoGameEntrypoint> {
  StreamSubscription? _subscription;

  final List<UnoCard> _cards = [];

  final List<SingleCardComponent> _components = [];
  _LineAbovePlayer? _lineAbovePlayer;

  int? _couldBeMissingNextIndex;

  OwnHandComponent({Vector2? position, Vector2? size})
      : super(position: position, size: size);

  void _handlePlayerEventState(PlayerState event) {
    // Handle line
    if (_lineAbovePlayer != null) {
      if (event.playersTurnId == gameRef.unoRepo.selfId) {
        _lineAbovePlayer!.color = Colors.lightGreenAccent;
      } else {
        _lineAbovePlayer!.color = Colors.white;
      }
    }

    // Handle Cards
    if (_cards == event.hand) {
      return;
    }
    final result = ListComparisonResult.compare(_cards, event.hand);

    // If user played one card in the middle of his deck, remove this occurence
    // to make it look like he really played *that* card, not some card with the
    // same characteristics
    if (_couldBeMissingNextIndex != null &&
        _cards.length > _couldBeMissingNextIndex!) {
      if (result.resultList1.contains(_cards[_couldBeMissingNextIndex!])) {
        final _missingCard = _cards[_couldBeMissingNextIndex!];
        _cards.removeAt(_couldBeMissingNextIndex!);
        _couldBeMissingNextIndex = null;
        result.resultList1.remove(_missingCard);
      }
    }

    _cards.removeWhere((element) {
      if (result.resultList1.contains(element)) {
        result.resultList1.remove(element);
        return true;
      }
      return false;
    });

    _cards.addAll(result.resultList2);

    _createComponents();
  }

  void _createComponents() {
    for (var element in children) {
      if (element is SingleCardComponent) {
        remove(element);
      }
    }
    _components.clear();

    final cardHeight = size.y;
    final cardWidth = cardHeight / cardHeightWidthRatio;
    final cardSize = Vector2(cardWidth, cardHeight);

    final maxDelta = cardWidth * 5 / 7;

    final cardDelta =
        ((size.x - cardWidth) / (_cards.length - 1)).clamp(0, maxDelta);
    final allCardsWidth = cardDelta * (_cards.length - 1) + cardWidth;
    final startX = (size.x - allCardsWidth) / 2;

    for (var i = 0; i < _cards.length; i++) {
      final element = _cards[i];
      final component = SingleCardComponent(
        element,
        onTap: () {
          gameRef.unoRepo.playCard(element);
          _couldBeMissingNextIndex = i;
        },
        onHoverEnterCallback: (component) {
          if (component.isLoaded) {
            final otherEffect = component.children.whereType<MoveEffect>();
            component.removeAll(otherEffect);

            component.add(
              MoveEffect.to(
                Vector2(component.x, -cardHeight * 0.3),
                EffectController(duration: 0.3, startDelay: 0.05),
              ),
            );
          }
        },
        onHoverLeaveCallback: (component) {
          if (component.isLoaded) {
            final otherEffect = component.children.whereType<MoveEffect>();
            component.removeAll(otherEffect);

            component.add(
              MoveEffect.to(
                Vector2(component.x, 0),
                EffectController(duration: 0.3, startDelay: 0.05),
              ),
            );
          }
        },
      );
      component.x =
          _components.isEmpty ? startX : _components.last.x + cardDelta;
      component.y = 0;
      component.size = cardSize;
      _components.add(component);
      add(component);
    }
  }

  @override
  Future<void>? onLoad() {
    _subscription = gameRef.unoRepo.playerStateStream.listen(_handlePlayerEventState);
    if (gameRef.unoRepo.lastPlayerState != null) {
      _handlePlayerEventState(gameRef.unoRepo.lastPlayerState!);
    }

    _lineAbovePlayer = _LineAbovePlayer(
        color: Colors.white,
        size: Vector2(size.x, 5),
        position: Vector2(0, -10));
    add(_lineAbovePlayer!);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 gameSize) {
    _lineAbovePlayer?.size = Vector2(size.x, 5);
    super.onGameResize(gameSize);
  }

  @override
  void onRemove() {
    _subscription?.cancel();
    super.onRemove();
  }
}

class _LineAbovePlayer extends PositionComponent {
  late EffectController _controller;

  ColorTween? _colorTween;

  Color _color;
  _LineAbovePlayer(
      {required Color color, Vector2? position, Vector2? size, double? angle})
      : _color = color,
        super(position: position, size: size, angle: angle) {
    _controller = LinearEffectController(1);
  }

  set color(Color color) {
    _colorTween = ColorTween(begin: _color, end: color);
  }

  @override
  void update(double dt) {
    if (_colorTween != null) {
      _controller.advance(dt);
      // Take old value if color tween does not have any more values
      _color = _colorTween!.transform(_controller.progress) ?? _color;
      if (_controller.completed) {
        _colorTween = null;
        _controller.setToStart();
      }
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.x, size.y), Radius.circular(size.y / 2));
    final paint = Paint()..color = _color;
    canvas.drawRRect(rect, paint);
  }
}

extension GroupingExtension<T> on Iterable<T> {
  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    return fold({}, (Map<K, List<T>> map, T element) {
      final key = keySelector(element);
      map[key] = (map[key]?.toList() ?? [])..add(element);
      return map;
    });
  }
}

class ListComparisonResult<T> {
  final List<T> resultList1;
  final List<T> resultList2;

  ListComparisonResult(this.resultList1, this.resultList2);

  static ListComparisonResult<T> compare<T>(List<T> list1, List<T> list2) {
    return ListComparisonResult(surplus(list1, list2), surplus(list2, list1));
  }

  static List<T> surplus<T>(List<T> surplusList, List<T> compareList) {
    final cList = compareList.toList();

    final List<T> resultList = [];
    for (var i = 0; i < surplusList.length; i++) {
      final item = surplusList[i];
      if (!cList.contains(item)) {
        resultList.add(item);
      } else {
        cList.remove(item);
      }
    }
    return resultList;
  }
}
