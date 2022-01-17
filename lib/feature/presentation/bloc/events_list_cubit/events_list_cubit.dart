import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_events_by_category_id.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_events_by_ids.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/events_list_cubit/events_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'Cache failure';

class EventsListCubit extends Cubit<EventsListState>{
  final GetEventsByCategoryId getEventsByCategoryId;
  final GetEventsByIds getEventsByIds;

  EventsListCubit({
    required this.getEventsByCategoryId,
    required this.getEventsByIds,
  }) : super(EventsListEmpty());

  void loadEventsListByCategoryId({categoryId}) async {
    if (state is EventsListLoading) return;

    final currentState = state;

    var events = <EventEntity>[];

    if(currentState is EventsListLoaded){
      events = currentState.eventsList;
    }

    emit(EventsListLoading());

    final failureOrCategories = await getEventsByCategoryId(GetEventsByCategoryIdParams(categoryId: categoryId));

    failureOrCategories.fold((error) => emit(EventsListError(message: _mapFailureToMessage(error))), (eventsList) {
      events = eventsList;
      emit(EventsListLoaded(events));
    });
  }

  void loadEventsListByIds() async {
    if (state is EventsListLoading) return;

    final currentState = state;

    var events = <EventEntity>[];

    if(currentState is EventsListLoaded){
      events = currentState.eventsList;
    }

    emit(EventsListLoading());

    final failureOrEvents = await getEventsByIds(GetEventsByIdsParams());

    failureOrEvents.fold((error) => emit(EventsListError(message: _mapFailureToMessage(error))), (eventsList) {
      events = eventsList;
      emit(EventsListLoaded(events));
    });
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}