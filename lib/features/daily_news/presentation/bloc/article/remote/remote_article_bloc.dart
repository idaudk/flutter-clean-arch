import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goto_app/features/daily_news/domain/entities/articles.dart';
import 'package:dio/dio.dart';
import 'package:goto_app/features/daily_news/domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

//bloc will use entity model from domain layer
class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
// using ussecase to call the repo functions from domain layer
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticleLoading()) {
    on<RemoteArticleGetEvent>(remoteArticleGetEvent);
  }

  FutureOr<void> remoteArticleGetEvent(
      RemoteArticleGetEvent event, Emitter<RemoteArticleState> emit) {}
}
