import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:sport_shedule_mobile/feature/domain/entities/player_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/score_entity.dart';

class EventEntity extends Equatable{
  final int id;
  final String name;
  final DateTime date;
  final int categoryId;
  final PlayerEntity firstPlayer;
  final PlayerEntity secondPlayer;
  final ScoreEntity score;
  final List<String> images;

  EventEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.categoryId,
    required this.firstPlayer,
    required this.secondPlayer,
    required this.score,
    required this.images});

  @override
  List<Object> get props => [id, name, date, categoryId, firstPlayer, secondPlayer, score, images];
}