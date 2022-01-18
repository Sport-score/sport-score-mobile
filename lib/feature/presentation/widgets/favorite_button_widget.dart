import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/event_cubit/event_cubit.dart';

import '/locator_service.dart' as di;

class FavoriteButtonWiget extends StatelessWidget{
  int eventId;
  bool isFavorite;

  FavoriteButtonWiget({
    required this.eventId,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context){
    if(isFavorite){
      return FloatingActionButton(
        backgroundColor: AppColors.mainBackground,
        foregroundColor: AppColors.orange,
        onPressed: (){
          di.sl<EventCubit>().deleteFromFavorite(eventId: eventId);
        },
        child: Icon(
          Icons.favorite_outlined,
          color: AppColors.orange,
        ),
      );
    }
    else{
      return FloatingActionButton(
        backgroundColor: AppColors.mainBackground,
        foregroundColor: AppColors.orange,
        onPressed: (){
          di.sl<EventCubit>().addToFavorite(eventId: eventId);
        },
        child: Icon(
          Icons.favorite_border_outlined,
          color: AppColors.orange,
        ),
      );
    }
  }
}