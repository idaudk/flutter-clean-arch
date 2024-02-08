import 'package:dio/dio.dart';
import 'package:goto_app/core/constants/constants.dart';
import 'package:goto_app/features/products/data/model/product.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: productAPIBaseUrl)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET('/products/search')
  Future<HttpResponse<ProductResponse>> searchProducts({@Query('q') String? q});
}
