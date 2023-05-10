
import 'package:furniture/models/services/service.dart';
import '../Product.dart';
import '../services/base_service.dart';

class ProductRepository {
  final BaseService _productService = MainService();

  Future<List<Product>> fetchProducts() async {
    dynamic response = await _productService.getResponse('/products');

    List<Product> products = (response as List).map((data) => Product.fromJson(data)).toList();

    return products;
  }
}
