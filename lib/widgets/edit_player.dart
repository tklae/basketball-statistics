import 'package:basketball_statistics/models/player.dart';
import 'package:basketball_statistics/models/team.dart';
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
    String _editedPlayerFirstName = _originalPlayer.firstName;
    String _editedPlayerLastName = _originalPlayer.lastName;
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
                    initialValue: _editedPlayerFirstName,
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
                    onSaved: (val) =>
                        setState(() => _editedPlayerFirstName = val),
                  ),
                  TextFormField(
                    initialValue: _editedPlayerLastName,
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
                    onSaved: (val) =>
                        setState(() => _editedPlayerLastName = val),
                  ),
                  TextFormField(
                    initialValue: _editedPlayerMmbNumber,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: "MMB Number",
                        hintText: "001"),
                    onSaved: (val) =>
                        setState(() => _editedPlayerMmbNumber = val),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: RaisedButton(
                      color: Colors.orange,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Team _teamRoster = Provider.of<Team>(context);
                          _teamRoster.replace(
                              _originalPlayer,
                              new Player(
                                  firstName: _editedPlayerFirstName,
                                  lastName: _editedPlayerLastName,
                                  mmbNumber: _editedPlayerMmbNumber));
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
