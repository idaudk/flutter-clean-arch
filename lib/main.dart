import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goto_app/config/routes/router.dart';
import 'package:goto_app/config/themes/app_themes.dart';
import 'package:goto_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:goto_app/features/daily_news/presentation/pages/home/daily_news_page.dart';
import 'package:goto_app/injector_container.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routerConfig: router,
      // home: BlocProvider<RemoteArticleBloc>(
      //     create: (context) => sl()
      //       ..add(const RemoteArticleGetEvent()),
      //     child: const DailyNewsPage()),
    );
  }
}
