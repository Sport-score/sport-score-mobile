import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class AddEventToFavorite extends UseCase<void, AddEventToFavoriteParams>{
  final EventRepository eventRepository;

  AddEventToFavorite(this.eventRepository);

  Future<Either<Failure, void>> call(AddEventToFavoriteParams params) async{
    return await eventRepository.addEventToFavorite(params.eventId);
  }
}

class AddEventToFavoriteParams extends Equatable{
  int eventId;

  AddEventToFavoriteParams({required this.eventId});

  @override
  List<Object> get props => [eventId];
}