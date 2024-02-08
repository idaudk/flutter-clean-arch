import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/core/utils/enums.dart';
import 'package:goto_app/features/products/domain/entities/products.dart';
import 'package:dio/dio.dart';
import 'package:goto_app/features/products/domain/usecases/search_product.dart';

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
    final dataState = await _searchProductUseCase.call();
    //checking data from api call
    if (dataState.data!.isNotEmpty && dataState is DataSuccess) {
      print('************************* loaded ************************');

      emit(state.copyWith(
        blocsStates: BlocsStates.loaded,
        searchResults: dataState.data,
      ));
    }
    if (dataState is DataFailed) {
      print('************************* error ************************');
      print(dataState.error);
      emit(state.copyWith(
          blocsStates: BlocsStates.error,
          errorType: dataState.error?.type ?? DioExceptionType.unknown,
          message: dataState.error?.message ?? 'nil'));
    }
  }
}
