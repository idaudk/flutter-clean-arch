part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

final class ArticleRemoteInitial extends RemoteArticleState {}
final class ArticleReinmoteLoadg extends RemoteArticleState {}
final class ArticleRemoteDone extends RemoteArticleState {
  const ArticleRemoteDone(List<ArticleEntity> article) : super(articles: article);
}
final class ArticleRemoteError extends RemoteArticleState {
  const ArticleRemoteError(DioException error) : super(error: error);
}
