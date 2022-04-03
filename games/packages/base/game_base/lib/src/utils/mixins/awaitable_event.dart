import 'dart:async';

import 'package:game_base/game_base.dart';

class GameClosedException implements Exception {}

/// Helper class holding the type of the completer and
/// the completer itself
class _EventHolder {
  /// Should always correspond to the type resulted by the completer
  final Type t;

  /// The completer
  final Completer completer;

  _EventHolder(this.t, this.completer);
}

/// Mixin to add functionality to wait for the occurrence of a certain event by a player
mixin AvaitableEvent<PlayerGameEvent extends Serializable,
        ServerGameEvent extends Serializable>
    on Game<PlayerGameEvent, ServerGameEvent> {
  /// Stores all events currently waited for.
  final Map<SingleSessionHandler<PlayerGameEvent, ServerGameEvent>,
      List<_EventHolder>> _awaitingEvents = {};

  @override
  close() {
    super.close();
    // Make sure there are no more events waiting
    _awaitingEvents.forEach((key, value) {
      value.forEach((element) {
        element.completer.completeError(GameClosedException());
      });
    });
  }

  @override
  void onPlayerGameEvent(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player,
      PlayerGameEvent event) {
    // Check whether current player is waiting for an event. If so, complete the completer
    if (_awaitingEvents.containsKey(player)) {
      _awaitingEvents[player]!.forEach((element) {
        if (event.runtimeType == element.t) {
          // There is no need to remove the completer from the list, since it will be removed while awaiting it.
          element.completer.complete(event);
        }
      });
    }
    super.onPlayerGameEvent(player, event);
  }

  /// Await for an event of type [T] from [player].
  ///
  /// If [timeout] is provided, the future will only be awaited as long as [timeout]
  /// defines, then return [null].
  ///
  /// Throws [GameClosedException] if the game is closed while awaiting this event.
  Future<T?> awaitEvent<T extends PlayerGameEvent>(
      SingleSessionHandler<PlayerGameEvent, ServerGameEvent> player,
      {Duration? timeout}) async {
    final completer = Completer<T?>();

    if (_awaitingEvents.containsKey(player)) {
      _awaitingEvents[player]!.add(_EventHolder(T, completer));
    } else {
      _awaitingEvents[player] = [_EventHolder(T, completer)];
    }
    // In all cases remove event from the list.
    if (timeout != null) {
      final res = await completer.future.timeout(timeout, onTimeout: () {
        completer.completeError(GameClosedException());
        return null;
      });
      _awaitingEvents[player]?.remove(completer);
      return res;
    } else {
      final res = await completer.future;
      _awaitingEvents[player]?.remove(completer);
      return res;
    }
  }
}
