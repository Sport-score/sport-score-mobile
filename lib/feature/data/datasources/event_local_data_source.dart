import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/core/errors/exception.dart';

abstract class EventLocalDataSource{
  List<int> getFavoriteEventsIds();
  void addFavoriteEventIdToCache(int eventId);
}

const CACHED_FAVORITE_EVENTS_LIST = 'CACHED_FAVORITE_EVENTS_LIST';

class EventLocalDataSourceImpl implements EventLocalDataSource{
  final SharedPreferences sharedPreferences;

  EventLocalDataSourceImpl({required this.sharedPreferences});

  @override
  void addFavoriteEventIdToCache(int eventId){
    final jsonFavoriteEventsList = sharedPreferences.getStringList(CACHED_FAVORITE_EVENTS_LIST);
    if(jsonFavoriteEventsList!.isNotEmpty){
      List<String> favoriteEventsList = jsonFavoriteEventsList.map((eventId) => json.decode(eventId) as String).toList();
      favoriteEventsList.add(eventId.toString());
      sharedPreferences.setStringList(CACHED_FAVORITE_EVENTS_LIST, favoriteEventsList);
    }
    else{
      List<String> favoriteEventsList = [eventId.toString()];
      sharedPreferences.setStringList(CACHED_FAVORITE_EVENTS_LIST, favoriteEventsList);
    }
  }

  @override
  List<int> getFavoriteEventsIds() {
    final jsonFavoriteEventsList = sharedPreferences.getStringList(CACHED_FAVORITE_EVENTS_LIST);
    if(jsonFavoriteEventsList!.isNotEmpty){
      List<int> favoriteEventsList = jsonFavoriteEventsList.map((eventId) => int.parse(json.decode(eventId))).toList();
      return favoriteEventsList;
    }
    else{
      throw CacheException();
    }
  }

}