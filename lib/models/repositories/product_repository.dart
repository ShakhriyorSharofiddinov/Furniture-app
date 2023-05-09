import 'package:furniture/models/services/service.dart';

import '../Product.dart';
import '../services/base_service.dart';

class ProductRepository {
  final BaseService _productService = MainService();

  Future<List<Product>> fetchProducts() async {
    dynamic response = await _productService.getResponse('/products');

    final jsonData = response['results'] as List;

    List<Product> movies = jsonData.map((e) => Product.fromJson(e)).toList();
    return movies;
  }
}
