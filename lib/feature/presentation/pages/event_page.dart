import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/details_event_widget.dart';

import '/locator_service.dart' as di;

class EventPage extends StatelessWidget{
  final EventEntity event;

  EventPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventCubit>(
          create: (context) => di.sl<EventCubit>()..loadEvent(eventId: event.id),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTextWidget(text: event.name),
          centerTitle: true,
          backgroundColor: AppColors.cellBackground,
        ),
        body: DetailsEventWidget(event: event,),
      ),
    );
  }
}