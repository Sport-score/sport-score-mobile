import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/pages/favorite_events_list_page.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';

class AppBarWidget extends StatelessWidget{
  final String title;

  AppBarWidget({required this.title});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: AppBarTextWidget(text: title),
      centerTitle: true,
      backgroundColor: AppColors.cellBackground,
      actions: [
        IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteEventsListPage(),
                ),
              );
            },
            icon: Icon(Icons.favorite)),
      ],
    );
  }
}