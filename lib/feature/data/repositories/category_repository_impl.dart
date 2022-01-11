import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/core/errors/exception.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/platform/network_info.dart';
import 'package:sport_shedule_mobile/feature/data/datasources/cetagory_api_data_source.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final CategoryAPIDataSource apiDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.apiDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    if (await networkInfo.isConnected){
      try{
        final remoteCategories = await apiDataSource.getAllCategories();
        return Right(remoteCategories);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ServerFailure());
    }
  }

}