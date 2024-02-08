import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goto_app/core/utils/enums.dart';
import 'package:goto_app/features/products/presentation/bloc/search/search_product_bloc.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context
                .read<SearchProductBloc>()
                .add(const SearchProductPressedEvent(q: 'iphone'));
          },
          label: const Text('search iphone')),
      body: BlocBuilder<SearchProductBloc, SearchProductState>(
          builder: (context, state) {
        if (state.blocsStates == BlocsStates.loading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state.blocsStates == BlocsStates.error) {
          return Center(
            child: Column(
              children: [Text(state.errorType.name), Text(state.message)],
            ),
          );
        }
        if (state.blocsStates == BlocsStates.loaded) {
          return const Center(
            child: Text('data loaded'),
          );
        }
        if (state.blocsStates == BlocsStates.intial) {
          return const Center(
            child: Text('initial state'),
          );
        }
        return const Center(
          child: Text('unknown state'),
        );
      }),
    );
  }
}
