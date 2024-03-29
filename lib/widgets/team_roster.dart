import 'package:basketball_statistics/models/player.dart';
import 'package:basketball_statistics/models/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import 'bottom_navigation.dart';

class TeamRosterWidget extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player roster'),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.list)),
//        ],
      ),
      bottomNavigationBar: BottomNavigation(),
      body: _buildPlayerList(context),
      floatingActionButton: _addPlayersButton(context),
    );
  }

  Widget _buildPlayerList(BuildContext context) {
    Team _teamRoster = Provider.of<Team>(context);
    final _playerList = _teamRoster.players.length > 0
        ? _teamRoster.players
        : [Player.example()];

    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        padding: const EdgeInsets.all(1.0),
        itemCount: _playerList.length,
        itemBuilder: (BuildContext context, i) {
          final currentPlayer = _playerList[i];
          return _buildRow(context, currentPlayer);
        });
  }

  Widget _buildRow(BuildContext context, Player player) {
    return ListTile(
        title: Text(
          "${player.firstName} ${player.lastName}",
          style: _biggerFont,
        ),
        dense: true,
        subtitle: player.mmbNumber != null ? Text(player.mmbNumber) : null,
        leading: Icon(Icons.person),
        trailing: IconButton(
          disabledColor: Colors.green,
          onPressed: () {
            if (player.isExamplePlayer()) {
              return null;
            }
            Navigator.pushNamed(context, ROUTE_EDIT_PLAYER, arguments: player);
          },
          icon: Icon(Icons.edit,
              color: player.isExamplePlayer() ? Colors.black12 : Colors.black),
        ));
  }

  Widget _addPlayersButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, ROUTE_ADD_PLAYER);
      },
      child: Icon(Icons.person_add),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
    );
  }
}
