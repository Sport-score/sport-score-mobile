import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_state.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/error_text_widget.dart';

import '/locator_service.dart' as di;

class DetailsEventWidget extends StatelessWidget{
  final EventEntity event;

  const DetailsEventWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(builder: (context, state) {
      EventEntity event = this.event;
      bool isFavorite = false;
      if (state is EventLoading){
        return _loadingIndicator();
      }
      else if (state is EventLoaded){
        event = state.event;
        isFavorite = state.isFavorite;
      }
      else if (state is EventError){
        return Center(
          child: ErrorTextWidget(text: state.message),
        );
      }
      if(isFavorite){
        return Center(
          child: Column(
            children: [
              AppBarTextWidget(text: event.firstPlayer.name),
              AppBarTextWidget(text: event.score.scorePlayer1.toString()),
              SizedBox(
                height: 28,
              ),
              AppBarTextWidget(text: event.score.scorePlayer2.toString()),
              AppBarTextWidget(text: event.secondPlayer.name),
              SizedBox(
                height: 28,
              ),
              AppBarTextWidget(text: DateFormat('dd-MM-yyyy').format(event.date).toString()),
              FloatingActionButton(
                onPressed: (){
                  isFavorite = false;
                  di.sl<EventCubit>().deleteFromFavorite(eventId: event.id);
                },
                child: Icon(
                  Icons.favorite_outlined,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        );
      }
      else{
        return Center(
          child: Column(
            children: [
              AppBarTextWidget(text: event.firstPlayer.name),
              AppBarTextWidget(text: event.score.scorePlayer1.toString()),
              SizedBox(
                height: 28,
              ),
              AppBarTextWidget(text: event.score.scorePlayer2.toString()),
              AppBarTextWidget(text: event.secondPlayer.name),
              SizedBox(
                height: 28,
              ),
              AppBarTextWidget(text: DateFormat('dd-MM-yyyy').format(event.date).toString()),
              FloatingActionButton(
                onPressed: (){
                  isFavorite = true;
                  di.sl<EventCubit>().addToFavorite(eventId: event.id);
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        );
      }
    }
    );
  }

  Widget _loadingIndicator(){
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.orange,
        ),
      ),
    );
  }
}