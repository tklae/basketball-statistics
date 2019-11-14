import 'dart:collection';

import 'package:basketball_statistics/models/player.dart';
import 'package:flutter/foundation.dart';

class TeamRoster with ChangeNotifier {
  List<Player> _players = [];

  UnmodifiableListView<Player> get players => UnmodifiableListView(_players);

  void add(Player player) {
    _players.add(player);
    notifyListeners();
  }

  void replace(Player playerToReplace, Player replacement) {
    var indexToReplace = _players.indexOf(playerToReplace);
    _players.replaceRange(indexToReplace, indexToReplace+1, [replacement]);
    notifyListeners();
  }

  @override
  bool operator ==(Object other) =>
      other is TeamRoster &&
          runtimeType == other.runtimeType &&
          listEquals(_players, other._players);

  @override
  int get hashCode => _players.hashCode;

  @override
  String toString() {
    return 'TeamRoster{_players: ${_players.map((player) => player.toString()).join(',')})}';
  }
}
