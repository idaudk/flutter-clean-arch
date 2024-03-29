import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/core/usecases/usecase.dart';
import 'package:goto_app/features/products/domain/entities/products.dart';
import 'package:goto_app/features/products/domain/repository/product_repo.dart';

class SearchProductUseCase
    implements UseCase<DataState<List<ProductEntity>>, String> {
  final ProductRepository _productRepository;

  SearchProductUseCase(this._productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({ String? params}) {
    return _productRepository.searchProducts(params!);
  }
}
