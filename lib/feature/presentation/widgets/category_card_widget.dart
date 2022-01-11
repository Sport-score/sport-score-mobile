import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/pages/events_list_page.dart';

class CategoryCardWidget extends StatelessWidget{
  final CategoryEntity category;

  const CategoryCardWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EventsListPage(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(category.name),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}