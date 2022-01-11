import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class GetEventById extends UseCase<EventEntity, GetEventByIdParams>{
  final EventRepository eventRepository;

  GetEventById(this.eventRepository);

  Future<Either<Failure, EventEntity>> call(GetEventByIdParams params) async{
    return await eventRepository.getEventById(params.eventId);
  }
}

class GetEventByIdParams extends Equatable{
  int eventId;

  GetEventByIdParams({required this.eventId});

  @override
  List<Object> get props => [eventId];
}