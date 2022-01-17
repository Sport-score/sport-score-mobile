import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

abstract class EventState extends Equatable{
  const EventState();

  @override
  List<Object> get props => [];
}

class EventEmpty extends EventState{
  @override
  List<Object> get props => [];
}

class EventLoading extends EventState{
  @override
  List<Object> get props => [];
}

class EventLoaded extends EventState{
  final EventEntity event;
  final bool isFavorite;

  const EventLoaded({
    required this.event,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [event, isFavorite];
}

class EventError extends EventState{
  final String message;

  const EventError({required this.message});

  @override
  List<Object> get props => [message];
}