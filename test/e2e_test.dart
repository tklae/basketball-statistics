import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:basketball_statistics/main.dart';

void main() {
  testWidgets('Add and edit player', (WidgetTester tester) async {
    await tester.pumpWidget(BasketballStatistics());

    //Player roster
    final Finder examplePlayer = find.text("Hans Mustermann");
    expect(examplePlayer, findsOneWidget);

    //Add player
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    final Finder playerName = find.widgetWithText(TextFormField, 'Player name');
    final Finder mmbNumber = find.widgetWithText(TextFormField, 'MMB Number');
    final Finder submit = find.widgetWithText(RaisedButton, 'Create player');

    await tester.enterText(playerName, 'Player 1');
    await tester.enterText(mmbNumber, 'mmbNumber1');
    await tester.tap(submit);
    await tester.pumpAndSettle();

    //Player roster
    expect(submit, findsNothing);
    expect(examplePlayer, findsNothing);
    expect(find.text("Player 1"), findsOneWidget);
    expect(find.text("mmbNumber1"), findsOneWidget);

    //Edit player
    final Finder editButton = find.byType(IconButton).at(0);
    await tester.tap(editButton);
    await tester.pumpAndSettle();

    final Finder editSaveChanges = find.widgetWithText(RaisedButton, 'Save changes');
    await tester.enterText(playerName, 'Player 2');
    await tester.enterText(mmbNumber, 'mmbNumber2');
    await tester.tap(editSaveChanges);
    await tester.pumpAndSettle();

    //Player roster
    expect(submit, findsNothing);
    expect(find.text("Player 1"), findsNothing);
    expect(find.text("mmbNumber1"), findsNothing);
    expect(find.text("Player 2"), findsOneWidget);
    expect(find.text("mmbNumber2"), findsOneWidget);
  });
}
