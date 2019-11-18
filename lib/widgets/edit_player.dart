import 'package:basketball_statistics/models/player.dart';
import 'package:basketball_statistics/models/team_roster.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditPlayerState();
}

class EditPlayerState extends State<EditPlayer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit player')),
      body: _editPlayerForm(),
    );
  }

  Widget _editPlayerForm() {
    final Player _originalPlayer = ModalRoute.of(context).settings.arguments;
    String _editedPlayerName = _originalPlayer.name;
    String _editedPlayerMmbNumber = _originalPlayer.mmbNumber;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _editedPlayerName,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: "Player name",
                        hintText: "Tragic Bronson"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a player name';
                      }
                      return null;
                    },
                    onSaved: (val) => setState(() => _editedPlayerName = val),
                  ),
                  TextFormField(
                    initialValue: _editedPlayerMmbNumber,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: "MMB Number",
                        hintText: "001"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter the player's MMB number";
                      }
                      return null;
                    },
                    onSaved: (val) => setState(() => _editedPlayerMmbNumber = val),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: RaisedButton(
                      color: Colors.orange,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          TeamRoster _teamRoster = Provider.of<TeamRoster>(context);
                          _teamRoster.replace(_originalPlayer, new Player(name: _editedPlayerName, mmbNumber: _editedPlayerMmbNumber));
//                          Scaffold.of(context)
//                            ..removeCurrentSnackBar()
//                            ..showSnackBar(
//                                SnackBar(content: Text("Player edited")));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Save changes'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
