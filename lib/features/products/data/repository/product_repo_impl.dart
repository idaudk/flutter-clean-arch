import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:goto_app/features/products/data/model/product.dart';
import 'package:goto_app/features/products/domain/repository/product_repo.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductApiService _productApiService;

  const ProductRepoImpl(this._productApiService);

  @override
  Future<DataState<List<ProductModel>>> getProducts() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<ProductModel>>> searchProducts(String searchQuery) async {
    try {
      final httpResponse = await _productApiService.searchProducts(q: searchQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.products!);
      } else {
        return DataFailed(DioException(
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
