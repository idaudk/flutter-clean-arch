import 'package:goto_app/features/daily_news/domain/entities/articles.dart';

import '../../../../core/resources/data_states.dart';

//repo of the domain layer just have the interfaces, implimentaion will be done in data layer, 
//so we are using abstract class to define interface

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}