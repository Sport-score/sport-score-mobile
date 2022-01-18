import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/events_list_cubit/events_list_cubit.dart';
import 'package:sport_shedule_mobile/feature/presentation/pages/favorite_events_list_page.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/app_bar_text_widget.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/events_list_widget.dart';
import '/locator_service.dart' as di;

class EventsListPage extends StatelessWidget{
  final CategoryEntity category;

  const EventsListPage({required this.category});

  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventsListCubit>(
          create: (context) => di.sl<EventsListCubit>()..loadEventsListByCategoryId(categoryId: category.id),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTextWidget(text: category.name),
          centerTitle: true,
          backgroundColor: AppColors.cellBackground,
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteEventsListPage(),
                    ),
                  );
                },
                icon: Icon(Icons.favorite)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: EventsListWidget(category: category),
        ),
      ),
    );
  }
}