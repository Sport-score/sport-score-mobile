import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/pages/event_page.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/card_text_widget.dart';

class EventCardWidget extends StatelessWidget{
  final EventEntity event;

  const EventCardWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventPage(event: event),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: CardTextWidget(text: event.name),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}