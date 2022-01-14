import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sport_shedule_mobile/core/errors/exception.dart';
import 'package:sport_shedule_mobile/feature/data/models/category_model.dart';

abstract class CategoryAPIDataSource{
  /// Calls http://sport-shedule-backend.herokuapp.com/admin/category/all endpoint.
  ///
  /// Throws a [ServerException] for all errors codes.
  Future<List<CategoryModel>> getAllCategories();
}

class CategoryAPIDataSourceImpl implements CategoryAPIDataSource{
  final http.Client client;

  CategoryAPIDataSourceImpl({required this.client});

  @override
  Future<List<CategoryModel>> getAllCategories() async{
    final response = await client.get(
      Uri.parse('http://sport-shedule-backend.herokuapp.com/admin/category/all'),
      headers: {'Content-Type': 'application/json'}
    );
    if (response.statusCode == 200){
      final categories = json.decode(response.body);
      return (categories as List).map((category) => CategoryModel.fromJson(category)).toList();
    }
    else{
      throw ServerException();
    }
  }
}