import 'dart:async';
import 'dart:developer';

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

    try {
      final dataState = await _searchProductUseCase.call();
      log(dataState.toString());
    } catch (e, s) {
      print(s);
      throw Exception(
          "Problem while JSON decoding results. [error=${e.toString()}]");
    }

    // // checking data from api call
    // if (dataState.data!.isNotEmpty && dataState is DataSuccess) {
    //   log('************************* loaded ************************');

    //   emit(state.copyWith(
    //     blocsStates: BlocsStates.loaded,
    //     searchResults: dataState.data,
    //   ));
    // }
    // if (dataState is DataFailed) {
    //   log('************************* error ************************');
    //   log(dataState.error.toString());
    //   emit(state.copyWith(
    //       blocsStates: BlocsStates.error,
    //       errorType: dataState.error?.type ?? DioExceptionType.unknown,
    //       message: dataState.error?.message ?? 'nil'));
    // }
  }
}
