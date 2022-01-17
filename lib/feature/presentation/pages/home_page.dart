import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/pages/categories_list_page.dart';
import 'package:sport_shedule_mobile/feature/presentation/pages/favorite_events_list_page.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/card_text_widget.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTextWidget(text: 'Sport schedule'),
        centerTitle: true,
        backgroundColor: AppColors.cellBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteEventsListPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cellBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const ListTile(
                  title: CardTextWidget(text: 'Favorite events'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesListPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cellBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const ListTile(
                  title: CardTextWidget(text: 'Categories'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.orange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}