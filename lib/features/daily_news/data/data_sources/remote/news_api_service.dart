import 'package:goto_app/core/constants/constants.dart';
import 'package:goto_app/features/daily_news/data/model/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

// command to run retrofit
// flutter pub run build_runner build
@RestApi(baseUrl: newAPIBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  // http response is used get the status of the request
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
