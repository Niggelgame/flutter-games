import 'dart:async';

import 'package:flame/components.dart';
import 'package:games/games/uno/models/uno_card.dart';
import 'package:games/games/uno/presentation/flame/uno_game_entrypoint.dart';

class OwnHandComponent extends PositionComponent
    with HasGameRef<UnoGameEntrypoint> {
  late final StreamSubscription _subscription;

  final List<UnoCard> _cards = [];

  int? _couldBeMissingNextIndex;

  @override
  Future<void>? onLoad() {
    gameRef.unoRepo.playerStateStream.listen((event) {
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
    });

    return super.onLoad();
  }

  @override
  void onRemove() {
    _subscription.cancel();
    super.onRemove();
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
