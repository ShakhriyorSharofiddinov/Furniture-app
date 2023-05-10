import 'package:flutter/cupertino.dart';
import 'package:furniture/models/category.dart';
import 'package:furniture/models/repositories/category_repository.dart';

import '../core/api_response.dart';

class CategoryViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty');

  ApiResponse get response {
    return _apiResponse;
  }

  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories {
    return _categories;
  }

  Future<void> fetchCategoriesList() async {
    try {
      List<CategoryModel> categories = await CategoriesRepository().fetchCategories();
      _categories = categories;
      _apiResponse = ApiResponse.completed(categories);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
