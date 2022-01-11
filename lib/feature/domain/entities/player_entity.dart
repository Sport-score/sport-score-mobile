import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PlayerEntity extends Equatable{
  final int id;
  final String name;

  PlayerEntity({
    required this.id,
    required this.name
  });

  @override
  List<Object> get props => [id, name];
}