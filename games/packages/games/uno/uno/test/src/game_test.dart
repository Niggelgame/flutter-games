import 'package:test/test.dart';
import 'package:uno/uno.dart';

void main() {
  group('initialization', () {
    test('game with only one player fails', () async {
      expect(() => Game(initialPlayers: [Player()], config: GameConfig()),
          throwsException);
    });
    test('game with too many players fails', () async {
      expect(
          () => Game(
              initialPlayers: List.filled(5, Player()),
              config: GameConfig(maxPlayerCount: 4)),
          throwsException);
    });
  });
}
