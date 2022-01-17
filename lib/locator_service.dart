import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_shedule_mobile/core/platform/network_info.dart';
import 'package:sport_shedule_mobile/feature/data/datasources/cetagory_api_data_source.dart';
import 'package:sport_shedule_mobile/feature/data/datasources/event_api_data_source.dart';
import 'package:sport_shedule_mobile/feature/data/datasources/event_local_data_source.dart';
import 'package:sport_shedule_mobile/feature/data/repositories/category_repository_impl.dart';
import 'package:sport_shedule_mobile/feature/data/repositories/event_repository_impl.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/category_repository.dart';
import 'package:sport_shedule_mobile/feature/domain/repositories/event_repository.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/add_event_to_favorite.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/check_event_is_favorite.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/delete_event_from_favorite.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_all_categories.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_event_by_id.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_events_by_category_id.dart';
import 'package:sport_shedule_mobile/feature/domain/usecases/get_events_by_ids.dart';
import 'package:sport_shedule_mobile/feature/presentation/bloc/categories_list_cubit/categories_list_cubit.dart';

import 'feature/presentation/bloc/event_cubit/event_cubit.dart';
import 'feature/presentation/bloc/events_list_cubit/events_list_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //BLoC / Cubit
  sl.registerFactory(
        () => CategoriesListCubit(getAllCategories: sl()),
  );
  sl.registerFactory(
        () => EventsListCubit(
            getEventsByCategoryId: sl(),
            getEventsByIds: sl()
        ),
  );
  sl.registerFactory(
        () => EventCubit(
          getEventById: sl(),
          addEventToFavorite: sl(),
          deleteEventFromFavorite: sl(),
          checkEventIsFavorite: sl(),
        ),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllCategories(sl()));
  sl.registerLazySingleton(() => GetEventById(sl()));
  sl.registerLazySingleton(() => GetEventsByCategoryId(sl()));
  sl.registerLazySingleton(() => GetEventsByIds(sl()));
  sl.registerLazySingleton(() => AddEventToFavorite(sl()));
  sl.registerLazySingleton(() => DeleteEventFromFavorite(sl()));
  sl.registerLazySingleton(() => CheckEventIsFavorite(sl()));

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
          () => CategoryRepositoryImpl(
              apiDataSource: sl(),
              networkInfo: sl()),
  );
  sl.registerLazySingleton<EventRepository>(
        () => EventRepositoryImpl(
        apiDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl()),
  );

  sl.registerLazySingleton<CategoryAPIDataSource>(
          () => CategoryAPIDataSourceImpl(
              client: http.Client(),
          ),
  );
  sl.registerLazySingleton<EventAPIDataSource>(
        () => EventAPIDataSourceImpl(
      client: http.Client(),
    ),
  );
  sl.registerLazySingleton<EventLocalDataSource>(
          () => EventLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}