import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class GetEventsByCategoryId extends UseCase<List<EventEntity>, GetEventsByCategoryIdParams>{
  final EventRepository eventRepository;

  GetEventsByCategoryId(this.eventRepository);

  Future<Either<Failure, List<EventEntity>>> call(GetEventsByCategoryIdParams params) async{
    return await eventRepository.getEventsByCategoryId(params.categoryId);
  }
}

class GetEventsByCategoryIdParams extends Equatable{
  final int categoryId;

  GetEventsByCategoryIdParams({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}