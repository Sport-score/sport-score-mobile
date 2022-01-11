import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

class EventCardWidget extends StatelessWidget{
  final EventEntity event;

  const EventCardWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cellBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(event.name),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}