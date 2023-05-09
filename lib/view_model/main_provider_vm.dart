import 'package:flutter/cupertino.dart';
import 'package:furniture/models/Product.dart';
import 'package:furniture/models/repositories/product_repository.dart';

import '../core/api_response.dart';

class MoviesListViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty');

  ApiResponse get response {
    return _apiResponse;
  }

  List<Product> _products = [];

  List<Product> get products {
    return _products;
  }

  Future<void> fetchProductsList() async {
    try {
      List<Product> products = await ProductRepository().fetchProducts();
      _products = products;
      _apiResponse = ApiResponse.completed(products);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
