import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/core/utils/enums.dart';
import 'package:goto_app/features/products/domain/entities/products.dart';
import 'package:goto_app/features/products/domain/usecases/search_product.dart';
import 'package:goto_app/injector_container.dart';
import 'package:logger/logger.dart';

import '../../../../../core/resources/exception_handler.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final SearchProductUseCase _searchProductUseCase;

  SearchProductBloc(this._searchProductUseCase)
      : super(const SearchProductState()) {
    on<SearchProductPressedEvent>(searchProductPressedEvent);
  }

  Future<FutureOr<void>> searchProductPressedEvent(
      SearchProductPressedEvent event, Emitter<SearchProductState> emit) async {
    //emiting loading state
    emit(state.copyWith(blocsStates: BlocsStates.loading));
    //calling api
    final dataState = await _searchProductUseCase(params: event.q);

    if (dataState is DataFailed) {
      sl<Logger>().e('Exception', error: dataState.error);

      emit(state.copyWith(
        blocsStates: BlocsStates.error,
        message: DioExceptionHandler.handleException(dataState.error!),
      ));
    }

    if (dataState is DataSuccess) {
      emit(state.copyWith(
          blocsStates: BlocsStates.loaded, searchResults: dataState.data));
    }
  }
}
