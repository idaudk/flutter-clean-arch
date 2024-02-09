import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/features/products/domain/entities/products.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> searchProducts(String searchQuery);
  Future<DataState<List<ProductEntity>>> getProducts();
}
