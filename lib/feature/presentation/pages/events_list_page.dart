import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/events_list_widget.dart';

class EventsListPage extends StatelessWidget{
  final CategoryEntity category;

  const EventsListPage({required this.category});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        centerTitle: true,
        backgroundColor: AppColors.cellBackground,
        titleTextStyle: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: EventsListWidget(events: category.events,),
    );
  }
}