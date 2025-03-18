import 'package:equatable/equatable.dart';

class Player extends Equatable {
  const Player(this.name, this.jersyNo, this.role);

  final String name;
  final String jersyNo;
  final String role;

  @override
  List<Object?> get props => [name, jersyNo, role];
}
