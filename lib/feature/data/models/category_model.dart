import 'package:meta/meta.dart';
import 'package:sport_shedule_mobile/feature/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{

  CategoryModel({
    @required id,
    @required name,
  }): super(
    id: id,
    name: name,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}