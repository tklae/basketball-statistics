import 'package:basketball_statistics/models/player.dart';
import 'package:basketball_statistics/models/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddPlayerState();
}

class AddPlayerState extends State<AddPlayer> {
  final _formKey = GlobalKey<FormState>();
  String _playerFirstName;
  String _playerLastName;
  String _playerMmbNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add player')),
      body: _addPlayerForm(),
    );
  }

  Widget _addPlayerForm() {
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
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: "First name",
                        hintText: "Tragic"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a first name';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _playerFirstName = val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: "Last name",
                        hintText: "Bronson"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a last name';
                      }
                      return null;
                    },
                    onChanged: (val) => setState(() => _playerLastName = val),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: "MMB Number",
                        hintText: "001"),
                    onChanged: (val) => setState(() => _playerMmbNumber = val),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: RaisedButton(
                      color: Colors.orange,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          var teamRoster = Provider.of<Team>(context);
                          teamRoster.add(Player(
                              firstName: _playerFirstName,
                              lastName: _playerLastName,
                              mmbNumber: _playerMmbNumber));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Create player'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
