
import 'package:flutter/foundation.dart';
import 'package:furniture/models/category.dart';
import 'package:furniture/models/services/service.dart';
import 'package:furniture/view/screens/home/components/categories.dart';
import '../services/base_service.dart';

class CategoriesRepository {
  final BaseService _categoryService = MainService();

  Future<List<CategoryModel>> fetchCategories() async {
    dynamic response = await _categoryService.getResponse('/categories');

    List<CategoryModel> categories = (response as List).map((data) => CategoryModel.fromJson(data)).toList();

    return categories;
  }
}
