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

class EventLoadedIsFavorite extends EventState{
  final EventEntity event;
  final bool isFavorite = true;

  const EventLoadedIsFavorite({
    required this.event,
  });

  @override
  List<Object> get props => [event, isFavorite];
}

class EventLoadedIsNotFavorite extends EventState{
  final EventEntity event;
  final bool isFavorite = false;

  const EventLoadedIsNotFavorite({
    required this.event,
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