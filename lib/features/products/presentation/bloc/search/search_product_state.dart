part of 'search_product_bloc.dart';

class SearchProductState extends Equatable {
  final List<ProductEntity> searchResults;
  final BlocsStates blocsStates;
  final DioExceptionType errorType;
  final String message;

  const SearchProductState(
      {this.searchResults = const <ProductEntity>[],
      this.blocsStates = BlocsStates.intial,
      this.errorType = DioExceptionType.unknown,
      this.message = ''});

  SearchProductState copyWith({
    List<ProductEntity>? searchResults,
    BlocsStates? blocsStates,
    DioExceptionType? errorType,
    String? message,
  }) {
    return SearchProductState(
        blocsStates: blocsStates ?? this.blocsStates,
        searchResults: searchResults ?? this.searchResults,
        errorType: errorType ?? this.errorType,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [searchResults, blocsStates, errorType, message];
}
