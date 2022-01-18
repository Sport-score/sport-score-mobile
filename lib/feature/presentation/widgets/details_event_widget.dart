import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_state.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/error_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/event_image_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/favorite_button_widget.dart';

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
      else if (state is EventLoadedIsFavorite){
        event = state.event;
        isFavorite = state.isFavorite;
      }
      else if (state is EventLoadedIsNotFavorite){
        event = state.event;
        isFavorite = state.isFavorite;
      }
      else if (state is EventError){
        return Center(
          child: ErrorTextWidget(text: state.message),
        );
      }
      return Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: EdgeInsets.all(28),
        margin: EdgeInsets.all(28),
        alignment: Alignment.center,
        child: Column(
          children: [
            AppBarTextWidget(text: DateFormat('dd-MM-yyyy hh:mm aaa').format(event.date).toString()),
            SizedBox(
              height: 28,
            ),
            EventImageWiget(images: event.images),
            SizedBox(
              height: 28,
            ),
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
            FavoriteButtonWiget(eventId: event.id, isFavorite: isFavorite,)
          ],
        ),
      );
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