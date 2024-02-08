part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

final class RemoteArticleLoading extends RemoteArticleState {}

final class RemoteArticleDone extends RemoteArticleState {
  RemoteArticleDone(List<ArticleEntity> articles) : super(articles: articles);
}

final class RemoteArticleError extends RemoteArticleState {
  RemoteArticleError(DioException error) : super(error: error);
}
