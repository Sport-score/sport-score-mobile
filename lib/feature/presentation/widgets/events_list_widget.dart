import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

class EventsListWidget extends StatelessWidget{
  final List<EventEntity> events;

  const EventsListWidget({required this.events});

  @override
  Widget build(BuildContext context) {
      return ListView.separated(
          itemBuilder: (context, index){
            return Text(events[index].name);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.orange,
            );
          },
          itemCount: events.length);
  }
}