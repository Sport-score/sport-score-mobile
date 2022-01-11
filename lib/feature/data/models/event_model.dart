import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/feature/data/models/player_model.dart';
import 'package:sport_shedule_mobile/feature/data/models/score_model.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/event_entity.dart';

class EventModel extends EventEntity{

  EventModel({
    @required id,
    @required name,
    @required date,
    @required categoryId,
    @required firstPlayer,
    @required secondPlayer,
    @required score,
    @required images,
  }) : super(
    id: id,
    name: name,
    date: date,
    categoryId: categoryId,
    firstPlayer: firstPlayer,
    secondPlayer: secondPlayer,
    score: score,
    images: images,
  );

  factory EventModel.fromJson(Map<String, dynamic> json){
    return EventModel(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['date'] as String),
      categoryId: json['categoryId'],
      firstPlayer: json['firstPlayer'] != null ? PlayerModel.fromJson(json['firstPlayer']) : null,
      secondPlayer: json['secondPlayer'] != null ? PlayerModel.fromJson(json['secondPlayer']) : null,
      score: json['score'] != null ? ScoreModel.fromJson(json['score']) : null,
      images: (json['images'] as List<dynamic>).map((img) => img as String).toList(),
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'date': date.toIso8601String(),
      'categoryId': categoryId,
      'firstPlayer': firstPlayer,
      'secondPlayer': secondPlayer,
      'score': score,
      'images': images,
    };
  }
}