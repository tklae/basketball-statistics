import 'package:basketball_statistics/models/player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Is example player", () {
    test("should determine that it's the example player", () {
      expect(Player.example().isExamplePlayer(), true);
    });
    test("should determine that it's not the example player", () {
      final _player =
          Player(name: "not the example player", mmbNumber: "someNumber");
      expect(_player.isExamplePlayer(), false);
    });
  });
}
