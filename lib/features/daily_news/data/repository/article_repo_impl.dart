import 'dart:io';

import 'package:dio/dio.dart';
import 'package:goto_app/core/constants/constants.dart';
import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:goto_app/features/daily_news/data/model/article.dart';
import 'package:goto_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  const ArticleRepositoryImpl(this._newsApiService);
  //instead of article entity, we have to use article model from data layer
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, category: categoryQuery, country: countryQuery);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.unknown,
            response: httpResponse.response));
      }
    } on DioException catch (e){
      return DataFailed(e);
    }
  }
}
