part of 'search_product_bloc.dart';

sealed class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

class SearchProductPressedEvent extends SearchProductEvent {
  final String q;
  const SearchProductPressedEvent({required this.q});

  @override
  List<Object> get props => [q];
}
