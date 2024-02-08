import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goto_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Daily News'),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is RemoteArticleError) {
          return Center(
            child: Text(state.error!.message.toString()),
          );
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.articles![index].title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    state.articles?[index].content ?? 'Not Available',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              });
        }
        return const SizedBox.shrink();
      },
    );
  }
}
