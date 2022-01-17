import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/core/usecases/usecase.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/category_repository.dart';

class GetAllCategories extends UseCase<List<CategoryEntity>, GetAllCategoriesParams>{
  final CategoryRepository categoryRepository;

  GetAllCategories(this.categoryRepository);

  Future<Either<Failure, List<CategoryEntity>>> call(GetAllCategoriesParams params) async{
    return await categoryRepository.getAllCategories();
  }
}

class GetAllCategoriesParams extends Equatable{
  @override
  List<Object> get props => [];
}