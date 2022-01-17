import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class EventLocalDataSource{
  List<int> getFavoriteEventsIds();
  void addFavoriteEventIdToCache(int eventId);
  void deleteFavoriteEventIdToCache(int eventId);
  bool checkEventIsFavorite(int eventId);
}

const CACHED_FAVORITE_EVENTS_IDS_LIST = 'CACHED_FAVORITE_EVENTS_IDS_LIST';

class EventLocalDataSourceImpl implements EventLocalDataSource{
  final SharedPreferences sharedPreferences;

  EventLocalDataSourceImpl({required this.sharedPreferences});

  @override
  void addFavoriteEventIdToCache(int eventId){
    final jsonFavoriteEventsList = sharedPreferences.getStringList(CACHED_FAVORITE_EVENTS_IDS_LIST);
    if(jsonFavoriteEventsList != null){
      List<String> favoriteEventsList = jsonFavoriteEventsList.map((eventId) => json.decode(eventId).toString()).toList();
      favoriteEventsList.add(eventId.toString());
      sharedPreferences.setStringList(CACHED_FAVORITE_EVENTS_IDS_LIST, favoriteEventsList);
    }
    else{
      List<String> favoriteEventsList = [eventId.toString()];
      sharedPreferences.setStringList(CACHED_FAVORITE_EVENTS_IDS_LIST, favoriteEventsList);
    }
  }

  @override
  void deleteFavoriteEventIdToCache(int eventId){
    final jsonFavoriteEventsList = sharedPreferences.getStringList(CACHED_FAVORITE_EVENTS_IDS_LIST);
    if(jsonFavoriteEventsList != null){
      List<String> favoriteEventsList = jsonFavoriteEventsList.map((eventId) => json.decode(eventId).toString()).toList();
      if(favoriteEventsList.contains(eventId.toString())){
        favoriteEventsList.remove(eventId.toString());
      }
      sharedPreferences.setStringList(CACHED_FAVORITE_EVENTS_IDS_LIST, favoriteEventsList);
    }
  }

  @override
  List<int> getFavoriteEventsIds() {
    final jsonFavoriteEventsList = sharedPreferences.getStringList(CACHED_FAVORITE_EVENTS_IDS_LIST);
    if(jsonFavoriteEventsList != null){
      List<int> favoriteEventsList = jsonFavoriteEventsList.map((eventId) => json.decode(eventId) as int).toList();
      return favoriteEventsList;
    }
    else{
      return [];
    }
  }

  @override
  bool checkEventIsFavorite(int eventId) {
    final jsonFavoriteEventsList = sharedPreferences.getStringList(CACHED_FAVORITE_EVENTS_IDS_LIST);
    if(jsonFavoriteEventsList != null){
      List<String> favoriteEventsList = jsonFavoriteEventsList.map((eventId) => json.decode(eventId).toString()).toList();
      return favoriteEventsList.contains(eventId.toString());
    }
    else{
      return false;
    }
  }

}