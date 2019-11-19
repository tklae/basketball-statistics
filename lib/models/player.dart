import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String firstName, lastName, mmbNumber;

  Player({this.firstName, this.lastName, this.mmbNumber});

  Player.example()
      : firstName = 'Hans',
        lastName = 'Mustermann',
        mmbNumber = '001';

  Player.clone(Player other)
      : firstName = other.firstName,
        lastName = other.lastName,
        mmbNumber = other.mmbNumber;

  bool isExamplePlayer() {
    return Player.example() == this;
  }

  @override
  List<Object> get props => [firstName, lastName, mmbNumber];

  @override
  String toString() {
    return 'Player{firstName: $firstName, lastName: $lastName, mmbNumber: $mmbNumber}';
  }
}
