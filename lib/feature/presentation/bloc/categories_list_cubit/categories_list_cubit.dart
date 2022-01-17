import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/core/errors/failure.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_all_categories.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/categories_list_cubit/categories_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'Cache failure';

class CategoriesListCubit extends Cubit<CategoriesListState>{
  final GetAllCategories getAllCategories;

  CategoriesListCubit({required this.getAllCategories}) : super(CategoriesListEmpty());

  void loadCategoriesList() async {
    if (state is CategoriesListLoading) return;

    final currentState = state;

    var categories = <CategoryEntity>[];

    if(currentState is CategoriesListLoaded){
      categories = currentState.categoriesList;
    }

    emit(CategoriesListLoading());

    final failureOrCategories = await getAllCategories(GetAllCategoriesParams());
    
    failureOrCategories.fold((error) => emit(CategoriesListError(message: _mapFailureToMessage(error))), (categoriesList) {
      categories = categoriesList;
      emit(CategoriesListLoaded(categories));
    });
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}