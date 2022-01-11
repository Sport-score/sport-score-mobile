import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/player_entity.dart';

class PlayerModel extends PlayerEntity{
  PlayerModel({
    @required id,
    @required name,
  }) : super(
    id:id,
    name: name,
  );

  factory PlayerModel.fromJson(Map<String, dynamic> json){
    return PlayerModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
    };
  }
}