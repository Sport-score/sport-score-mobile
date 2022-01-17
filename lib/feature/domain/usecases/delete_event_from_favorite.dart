import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class DeleteEventFromFavorite extends UseCase<void, DeleteEventFromFavoriteParams>{
  final EventRepository eventRepository;

  DeleteEventFromFavorite(this.eventRepository);

  Future<Either<Failure, void>> call(DeleteEventFromFavoriteParams params) async{
    return await eventRepository.deleteEventToFavorite(params.eventId);
  }
}

class DeleteEventFromFavoriteParams extends Equatable{
  int eventId;

  DeleteEventFromFavoriteParams({required this.eventId});

  @override
  List<Object> get props => [eventId];
}