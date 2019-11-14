import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.face),
          title: new Text('Players'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(MdiIcons.basketballHoopOutline),
          title: new Text('Games'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.insert_chart),
          title: new Text('Statistics')
        )
      ],
    );
  }
}
