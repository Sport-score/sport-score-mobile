import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class GetEventsByIds extends UseCase<List<EventEntity>, GetEventsByIdsParams>{
  final EventRepository eventRepository;

  GetEventsByIds(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> call(GetEventsByIdsParams params) async{
    return await eventRepository.getEventsByIds();
  }
}

class GetEventsByIdsParams extends Equatable{
  List<int> eventsIds;

  GetEventsByIdsParams({required this.eventsIds});

  @override
  List<Object> get props => [eventsIds];
}