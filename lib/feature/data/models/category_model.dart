import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/feature/data/models/event_model.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{

  CategoryModel({
    @required id,
    @required name,
    @required events,
  }): super(
    id: id,
    name: name,
    events: events,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      events: (json['events'] as List<dynamic>).map((event) => event != null ? EventModel.fromJson(event) : null as EventModel).toList(),
    );
  }
}