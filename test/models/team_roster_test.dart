import 'package:basketball_statistics/models/player.dart';
import 'package:basketball_statistics/models/team_roster.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should add player", () {
    var teamRoster = TeamRoster();
    expect(teamRoster.players.length, 0);

    teamRoster.add(Player.example());
    expect(teamRoster.players.length, 1);
  });

  test("should replace player", () {
    var teamRoster = TeamRoster();
    var originalPlayer = Player.example();
    var replacement = Player(name: "Wiedeli", mmbNumber: "Dudeli");

    teamRoster.add(originalPlayer);
    teamRoster.replace(originalPlayer, replacement);

    expect(teamRoster.players.length, 1);
    expect(teamRoster.players[0], replacement);
  });

  test("list of players should not be modifiable from the outside", () {
    expect(() => TeamRoster().players.add(Player.example()), throwsUnsupportedError);
  });
}
