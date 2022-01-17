import 'package:equatable/equatable.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';

abstract class CategoriesListState extends Equatable{
  const CategoriesListState();

  @override
  List<Object> get props => [];
}

class CategoriesListEmpty extends CategoriesListState{
  @override
  List<Object> get props => [];
}

class CategoriesListLoading extends CategoriesListState{
  @override
  List<Object> get props => [];
}

class CategoriesListLoaded extends CategoriesListState{
  final List<CategoryEntity> categoriesList;

  const CategoriesListLoaded(this.categoriesList);

  @override
  List<Object> get props => [categoriesList];
}

class CategoriesListError extends CategoriesListState{
  final String message;

  const CategoriesListError({required this.message});

  @override
  List<Object> get props => [message];
}