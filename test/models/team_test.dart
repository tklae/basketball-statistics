import 'package:basketball_statistics/models/player.dart';
import 'package:basketball_statistics/models/team.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should add player", () {
    var teamRoster = Team();
    expect(teamRoster.players.length, 0);

    teamRoster.add(Player.example());
    expect(teamRoster.players.length, 1);
  });

  test("should replace player", () {
    var teamRoster = Team();
    var originalPlayer = Player.example();
    var replacement = Player(firstName: "Wiedeli", mmbNumber: "Dudeli");

    teamRoster.add(originalPlayer);
    teamRoster.replace(originalPlayer, replacement);

    expect(teamRoster.players.length, 1);
    expect(teamRoster.players[0], replacement);
  });

  test("list of players should not be modifiable from the outside", () {
    expect(() => Team().players.add(Player.example()), throwsUnsupportedError);
  });
}
