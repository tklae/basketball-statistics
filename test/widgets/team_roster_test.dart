import 'package:basketball_statistics/models/team.dart';
import 'package:basketball_statistics/widgets/team_roster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createWidgetForTesting(Widget child){
    return MultiProvider(
      providers: [
            ChangeNotifierProvider(builder: (context) => Team()),
      ],
      child:
     MaterialApp(
      home: child,
    ));
  }

  testWidgets('TeamRoster', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(TeamRosterWidget()));


    var listView = find.byType(ListView);
    expect(listView, findsOneWidget);
  });
}
