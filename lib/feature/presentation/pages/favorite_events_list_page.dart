import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/events_list_cubit/events_list_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/favorite_events_list_widget.dart';
import '/locator_service.dart' as di;

class FavoriteEventsListPage extends StatelessWidget{
  FavoriteEventsListPage();

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventsListCubit>(
          create: (context) => di.sl<EventsListCubit>()..loadEventsListByIds(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTextWidget(text: 'Favorite events'),
          centerTitle: true,
          backgroundColor: AppColors.cellBackground,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: FavoriteEventsListWidget(),
        ),
      ),
    );
  }
}