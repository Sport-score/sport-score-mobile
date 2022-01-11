import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

class EventPage extends StatelessWidget{
  final EventEntity event;

  const EventPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
        centerTitle: true,
        backgroundColor: AppColors.cellBackground,
        titleTextStyle: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(event.firstPlayer.name),
            Text(event.score.scorePlayer1.toString()),
            SizedBox(
              height: 28,
            ),
            Text(event.score.scorePlayer2.toString()),
            Text(event.secondPlayer.name),
            SizedBox(
              height: 28,
            ),
            Text(DateFormat('dd-MM-yyyy').format(event.date).toString()),
          ],
        ),
      ),
    );
  }
}