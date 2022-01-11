import 'package:dartz/dartz.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';

abstract class CategoryRepository{
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}