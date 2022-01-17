import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/categories_list_cubit/categories_list_state.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/category_card_widget.dart';

class CategoriesListWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesListState>(builder: (context, state) {
          List<CategoryEntity> categories = [];
          if (state is CategoriesListLoading){
            return _loadingIndicator();
          }
          else if (state is CategoriesListLoaded){
            categories = state.categoriesList;
          }
          else if (state is CategoriesListError){
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: AppColors.errorColor,
                  fontSize: 25,
                ),
              ),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index){
                return CategoryCardWidget(category: categories[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.orange,
                );
              },
              itemCount: categories.length,
          );
        }
    );
  }

  Widget _loadingIndicator(){
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.orange,
        ),
      ),
    );
  }
}