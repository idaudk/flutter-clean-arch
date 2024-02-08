import 'package:get_it/get_it.dart';
import 'package:goto_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:goto_app/features/daily_news/data/repository/article_repo_impl.dart';
import 'package:goto_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:goto_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:goto_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

//REGISTER SINGLETON -> RETURN SAME INSTANCE
//REGISTER FACTORY   -> RETURN NEW INSTANCE

Future<void> initDependencies() async {
  //DIO
  sl.registerSingleton<Dio>(Dio());

  //DEPENDENCIES

  // -API SERVICES
  sl.registerSingleton<NewsApiService>(NewsApiService(sl<Dio>()));

  // -REPOS
  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl<NewsApiService>()));

  //USECASES
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl<ArticleRepository>()));

  //INFO: BLOCS SHOULD NOT BE REGISTER AS SINGLETON BECAUSE IT WILL RETURN A NEW INSTANCE WHEN STATE IS CHANGED
  //BLOCS
  sl.registerFactory<RemoteArticleBloc>(
      () => RemoteArticleBloc(sl<GetArticleUseCase>()));
}
