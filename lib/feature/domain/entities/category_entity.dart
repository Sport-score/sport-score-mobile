import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final List<EventEntity> events;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.events
  });

  @override
  List<Object> get props => [id, name, events];
}