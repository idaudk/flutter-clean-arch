import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/features/daily_news/domain/entities/articles.dart';
import 'package:goto_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:logger/logger.dart';

import '../../../../../../core/resources/exception_handler.dart';
import '../../../../../../injector_container.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

//bloc will use entity model from domain layer
class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
// using ussecase to call the repo functions from domain layer
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(ArticleReinmoteLoadg()) {
    on<RemoteArticleGetEvent>(remoteArticleGetEvent);
  }

  Future<FutureOr<void>> remoteArticleGetEvent(
      RemoteArticleGetEvent event, Emitter<RemoteArticleState> emit) async {
    // IN DART CALL CAN BE CALLED BY USING CLASS NAME OBJECT.CALL() AND ALSO BY OBJECT()
    final dataState = await _getArticleUseCase.call();
    sl<Logger>().i(dataState);

    if (dataState is DataFailed) {
      sl<Logger>().e('Exception', error: dataState.error);
      
      emit(ArticleRemoteError(dataState.error!));
    }

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticleRemoteDone(dataState.data!));
    }
  }
}
