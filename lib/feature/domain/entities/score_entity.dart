import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ScoreEntity extends Equatable{
  final int id;
  final int scorePlayer1;
  final int scorePlayer2;

  ScoreEntity({
    required this.id,
    required this.scorePlayer1,
    required this.scorePlayer2
  });

  @override
  List<Object> get props => [id, scorePlayer1, scorePlayer2];
}