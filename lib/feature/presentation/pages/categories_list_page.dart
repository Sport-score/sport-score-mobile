import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/categories_list_widget.dart';

class CategoriesListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
        backgroundColor: AppColors.cellBackground,
        titleTextStyle: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: CategoriesListWidget(),
    );
  }
}