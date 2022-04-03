
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_base/game_base.dart';
import 'package:uno/uno.dart';
import 'package:uno_game/src/game/player_event.dart';
import 'package:uno_game/src/game/server_event.dart';

class UnoPlayer extends Player {
  final SingleSessionHandler<UnoPlayerEvent, UnoServerEvent> session;

  UnoPlayer({required this.session});

  bool _myTurn = false;
  @internal
  bool drawn = false;

  @override
  void onSkip() {
    super.onSkip();

    session.send(UnoServerEvent.simpleMessage('You have been skipped!'));
  }

  @override
  void onCardsDrawn(int amount) {
    super.onCardsDrawn(amount);

    if(amount > 0) {
      session.send(UnoServerEvent.cardsDrawn(session.sessionId, amount, cards, reason, state))
    }
  }
}