

import 'package:game_base/game_base.dart';

class TestGameEvent extends Serializable {
  int id;
  TestGameEvent(this.id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  factory TestGameEvent.fromJson(Map<String, dynamic> json) {
    return TestGameEvent(json['id']);
  }
}

class TestGame extends Game<TestGameEvent, TestGameEvent> {
  @override
  bool allowsMorePlayers() {
    return true;
  }

  @override
  void onPlayerGameEvent(player, event) {
    print('onPlayerGameEvent: $event');
    player.send(event);
  }

  @override
  TestGameEvent playerGameEventFromJson(Map<String, dynamic> json) => TestGameEvent.fromJson(json);

  @override
  TestGameEvent serverGameEventFromJson(Map<String, dynamic> json) => TestGameEvent.fromJson(json);

  @override
  String get name => gameName;

  static String get gameName => "TestGame";

  @override
  Map<String, dynamic> get config => {};

  @override
  void close() {
  }

  @override
  Map<String, dynamic> get configAsJson => {};
}