import 'package:basketball_statistics/routes.dart';
import 'package:basketball_statistics/widgets/add_player.dart';
import 'package:basketball_statistics/widgets/edit_player.dart';
import 'package:basketball_statistics/widgets/team_roster.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/team.dart';

void main() {
  runApp(BasketballStatistics());
}

class BasketballStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => Team()),
        ],
        child: MaterialApp(
          title: 'Basketball Statistics',
          initialRoute: ROUTE_HOME,
          routes: {
            ROUTE_HOME: (context) => TeamRosterWidget(),
            ROUTE_ADD_PLAYER: (context) => AddPlayer(),
            ROUTE_EDIT_PLAYER: (context) => EditPlayer()
          },
          theme: ThemeData(primaryColor: Colors.orange),
        ));
  }
}
