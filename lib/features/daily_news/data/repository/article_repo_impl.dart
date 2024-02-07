import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/features/daily_news/data/model/article.dart';
import 'package:goto_app/features/daily_news/domain/entities/articles.dart';
import 'package:goto_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  //instead of article entity, we have to use article model from data layer
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
   
    throw UnimplementedError();
  }
  
}