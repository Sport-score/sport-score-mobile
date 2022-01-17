import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class CheckEventIsFavorite extends UseCase<void, CheckEventIsFavoriteParams>{
  final EventRepository eventRepository;

  CheckEventIsFavorite(this.eventRepository);

  Future<Either<Failure, bool>> call(CheckEventIsFavoriteParams params) async{
    return await eventRepository.checkEventIsFavorite(params.eventId);
  }
}

class CheckEventIsFavoriteParams extends Equatable{
  int eventId;

  CheckEventIsFavoriteParams({required this.eventId});

  @override
  List<Object> get props => [eventId];
}