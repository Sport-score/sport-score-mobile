import 'package:dartz/dartz.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

abstract class EventRepository{
  Future<Either<Failure, List<EventEntity>>> getEventsByCategoryId(int categoryId);
  Future<Either<Failure, List<EventEntity>>> getEventsByIds();
  Future<Either<Failure, EventEntity>> getEventById(int eventId);
  Future<Either<Failure, bool>> checkEventIsFavorite(int eventId);
  Future<Either<Failure, List<int>>> getFavoriteEventsIds();
  Future<Either<Failure, void>> addEventToFavorite(int eventId);
  Future<Either<Failure, void>> deleteEventToFavorite(int eventId);
}