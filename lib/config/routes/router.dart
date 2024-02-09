// GoRouter configuration
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:goto_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:goto_app/features/daily_news/presentation/pages/home/daily_news_page.dart';
import 'package:goto_app/features/products/presentation/bloc/search/search_product_bloc.dart';
import 'package:goto_app/features/products/presentation/pages/search/search_product_page.dart';
import 'package:goto_app/injector_container.dart';

final router = GoRouter(
  initialLocation: '/daily-news',
  routes: [
    GoRoute(
      name: 'daily-news',
      path: '/daily-news',
      builder: (context, state) => BlocProvider<RemoteArticleBloc>(
        create: (context) => sl(),
        child: const DailyNewsPage(),
      ),
    ),
    GoRoute(
      name: 'search-product',
      path: '/search-product',
      builder: (context, state) => BlocProvider<SearchProductBloc>(
        create: (context) => sl(),
        child: SearchProductPage(),
      ),
    ),
  ],
);
