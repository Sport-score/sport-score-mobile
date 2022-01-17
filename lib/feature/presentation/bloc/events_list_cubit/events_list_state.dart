import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

abstract class EventsListState extends Equatable{
  const EventsListState();

  @override
  List<Object> get props => [];
}

class EventsListEmpty extends EventsListState{
  @override
  List<Object> get props => [];
}

class EventsListLoading extends EventsListState{
  @override
  List<Object> get props => [];
}

class EventsListLoaded extends EventsListState{
  final List<EventEntity> eventsList;

  const EventsListLoaded(this.eventsList);

  @override
  List<Object> get props => [eventsList];
}

class EventsListError extends EventsListState{
  final String message;

  const EventsListError({required this.message});

  @override
  List<Object> get props => [message];
}