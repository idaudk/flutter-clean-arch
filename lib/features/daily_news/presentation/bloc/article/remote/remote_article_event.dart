part of 'remote_article_bloc.dart';

sealed class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();

  @override
  List<Object> get props => [];
}

class RemoteArticleGetEvent extends RemoteArticleEvent {
  const RemoteArticleGetEvent();
}
