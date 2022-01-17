import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/add_event_to_favorite.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/check_event_is_favorite.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/delete_event_from_favorite.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_event_by_id.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'Cache failure';

class EventCubit extends Cubit<EventState>{
  final GetEventById getEventById;
  final AddEventToFavorite addEventToFavorite;
  final DeleteEventFromFavorite deleteEventFromFavorite;
  final CheckEventIsFavorite checkEventIsFavorite;

  EventCubit({
    required this.getEventById,
    required this.addEventToFavorite,
    required this.deleteEventFromFavorite,
    required this.checkEventIsFavorite,
  }) : super(EventEmpty());

  var event;
  bool isFavorite = false;

  void loadEvent({eventId}) async {
    if (state is EventLoading) return;

    final currentState = state;

    if(currentState is EventLoaded){
      event = currentState.event;
      isFavorite = currentState.isFavorite;
    }

    emit(EventLoading());

    final failureOrEvent = await getEventById(GetEventByIdParams(eventId: eventId));
    final failureOrIsFavorite = await checkEventIsFavorite(CheckEventIsFavoriteParams(eventId: eventId));

    failureOrEvent.fold((error) => emit(EventError(message: _mapFailureToMessage(error))), (_event) {
      event = _event;
    });

    failureOrIsFavorite.fold((error) => emit(EventError(message: _mapFailureToMessage(error))), (_isFavorite) {
      isFavorite = _isFavorite;
      emit(EventLoaded(event: event, isFavorite: isFavorite));
    });
  }

  void addToFavorite({eventId}) async {
    addEventToFavorite(AddEventToFavoriteParams(eventId: eventId));
  }

  void deleteFromFavorite({eventId}) async {
    deleteEventFromFavorite(DeleteEventFromFavoriteParams(eventId: eventId));
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