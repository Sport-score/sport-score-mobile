import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/categories_list_widget.dart';
import '/locator_service.dart' as di;

class CategoriesListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesListCubit>(
          create: (context) => di.sl<CategoriesListCubit>()..loadCategoriesList(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTextWidget(text: 'Categories'),
          centerTitle: true,
          backgroundColor: AppColors.cellBackground,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: CategoriesListWidget(),
        ),
      ),
    );
  }
}