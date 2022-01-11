import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/score_entity.dart';

class ScoreModel extends ScoreEntity{

  ScoreModel({
    @required id,
    @required scorePlayer1,
    @required scorePlayer2,
  }) : super(
    id: id,
    scorePlayer1: scorePlayer1,
    scorePlayer2: scorePlayer2,
  );

  factory ScoreModel.fromJson(Map<String, dynamic> json){
    return ScoreModel(
      id: json['id'],
      scorePlayer1: json['scorePlayer1'],
      scorePlayer2: json['scorePlayer2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'scorePlayer1': scorePlayer1,
      'scorePlayer2': scorePlayer2,
    };
  }
}