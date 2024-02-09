import 'package:get_it/get_it.dart';
import 'package:goto_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:goto_app/features/daily_news/data/repository/article_repo_impl.dart';
import 'package:goto_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:goto_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:goto_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:goto_app/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:goto_app/features/products/data/repository/product_repo_impl.dart';
import 'package:goto_app/features/products/domain/repository/product_repo.dart';
import 'package:goto_app/features/products/domain/usecases/search_product.dart';
import 'package:goto_app/features/products/presentation/bloc/search/search_product_bloc.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;

//REGISTER SINGLETON -> RETURN SAME INSTANCE
//REGISTER FACTORY   -> RETURN NEW INSTANCE

Future<void> initDependencies() async {
  //LOGGER
  sl.registerSingleton<Logger>(Logger());

  //DIO
  sl.registerSingleton<Dio>(Dio());

  //DEPENDENCIES

  // -API SERVICES
  sl.registerSingleton<NewsApiService>(NewsApiService(sl<Dio>()));
  sl.registerSingleton<ProductApiService>(ProductApiService(sl<Dio>()));

  // -REPOS
  sl.registerSingleton<ArticleRepository>(
      ArticleRepoImpl(newsApiService: sl()));

  sl.registerSingleton<ProductRepository>(
      ProductRepoImpl(sl<ProductApiService>()));

  //USECASES
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(articleRepository: sl()));

  sl.registerSingleton<SearchProductUseCase>(
      SearchProductUseCase(sl<ProductRepository>()));

  //INFO: BLOCS SHOULD NOT BE REGISTER AS SINGLETON BECAUSE IT WILL RETURN A NEW INSTANCE WHEN STATE IS CHANGED
  //BLOCS
  sl.registerFactory<RemoteArticleBloc>(
      () => RemoteArticleBloc(sl<GetArticleUseCase>()));

  sl.registerFactory<SearchProductBloc>(
      () => SearchProductBloc(sl<SearchProductUseCase>()));
}
