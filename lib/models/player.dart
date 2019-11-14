import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String name, mmbNumber;

  Player({this.name, this.mmbNumber});

  Player.example()
      : name = 'Hans Mustermann',
        mmbNumber = '001';

  Player.clone(Player other)
      : name = other.name,
        mmbNumber = other.mmbNumber;

  bool isExamplePlayer() {
    return this == Player.example();
  }

  @override
  List<Object> get props => [name, mmbNumber];

  @override
  String toString() {
    return 'Player{name: $name, mmbNumber: $mmbNumber}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Player &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          mmbNumber == other.mmbNumber;

  @override
  int get hashCode => super.hashCode ^ name.hashCode ^ mmbNumber.hashCode;
}
