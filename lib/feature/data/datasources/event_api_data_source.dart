import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sport_shedule_mobile/core/errors/exception.dart';
import 'package:sport_shedule_mobile/feature/data/models/event_model.dart';

abstract class EventAPIDataSource{
  /// Calls http://sport-shedule-backend.herokuapp.com/admin/event/byCategoryId/{id} endpoint.
  ///
  /// Throws a [ServerException] for all errors codes.
  Future<List<EventModel>> getEventsByCategoryId(int categoryId);

  /// Calls http://sport-shedule-backend.herokuapp.com/admin/event/byIds endpoint.
  ///
  /// Throws a [ServerException] for all errors codes.
  Future<List<EventModel>> getEventsByIds(List<int> eventsIds);

  /// Calls http://sport-shedule-backend.herokuapp.com/admin/event/{id} endpoint.
  ///
  /// Throws a [ServerException] for all errors codes.
  Future<EventModel> getEventById(int eventId);
}

class EventAPIDataSourceImpl implements EventAPIDataSource{
  final http.Client client;

  EventAPIDataSourceImpl({required this.client});

  @override
  Future<EventModel> getEventById(int eventId) async {
    final response = await client.get(
      Uri.parse('http://sport-shedule-backend.herokuapp.com/admin/event/$eventId'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200){
      final event = json.decode(response.body);
      return EventModel.fromJson(event);
    }
    else{
      throw ServerException();
    }
  }

  @override
  Future<List<EventModel>> getEventsByCategoryId(int categoryId) async {
    final response = await client.get(
        Uri.parse('http://sport-shedule-backend.herokuapp.com/admin/event/byCategoryId/$categoryId'),
        headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200){
      final events = json.decode(response.body);
      return (events as List).map((event) => EventModel.fromJson(event)).toList();
    }
    else{
      throw ServerException();
    }
  }

  @override
  Future<List<EventModel>> getEventsByIds(List<int> eventsIds) async {
    final response = await client.post(
        Uri.parse('http://sport-shedule-backend.herokuapp.com/admin/event/byIds'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(eventsIds),
    );
    if (response.statusCode == 200){
      final events = json.decode(response.body);
      return (events as List).map((event) => EventModel.fromJson(event)).toList();
    }
    else{
      throw ServerException();
    }
  }

}