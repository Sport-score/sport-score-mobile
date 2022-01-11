import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';

import 'feature/presentation/pages/categories_list_page.dart';
import 'locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesListCubit>(
            create: (context) => di.sl<CategoriesListCubit>()..loadCategoriesList(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            backgroundColor: AppColors.mainBackground,
            scaffoldBackgroundColor: AppColors.mainBackground,
          ),
          home: CategoriesListPage(),
        ),
    );
  }
}