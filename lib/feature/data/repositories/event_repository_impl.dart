import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/core/errors/exception.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/platform/network_info.dart';
import 'package:sport_shedule_mobile/feature/data/datasources/event_api_data_source.dart';
import 'package:sport_shedule_mobile/feature/data/datasources/event_local_data_source.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository{
  final EventAPIDataSource apiDataSource;
  final EventLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl({
    required this.apiDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, EventEntity>> getEventById(int eventId) async {
    if (await networkInfo.isConnected){
      try{
        final remoteEvent = await apiDataSource.getEventById(eventId);
        return Right(remoteEvent);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getEventsByCategoryId(int categoryId) async {
    if (await networkInfo.isConnected){
      try{
        final remoteEvents = await apiDataSource.getEventsByCategoryId(categoryId);
        return Right(remoteEvents);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getEventsByIds() async {
    if (await networkInfo.isConnected){
      try{
        final remoteEvents = await apiDataSource.getEventsByIds(localDataSource.getFavoriteEventsIds());
        return Right(remoteEvents);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ServerFailure());
    }
  }


}