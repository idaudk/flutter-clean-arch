import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goto_app/core/utils/enums.dart';
import 'package:goto_app/features/products/presentation/bloc/search/search_product_bloc.dart';

class SearchProductPage extends StatelessWidget {
  SearchProductPage({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       context
      //           .read<SearchProductBloc>()
      //           .add(const SearchProductPressedEvent(q: 'iphone'));
      //     },
      //     label: const Text('search iphone')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    context.read<SearchProductBloc>().add(
                        SearchProductPressedEvent(
                            q: _textEditingController.text));
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: BlocBuilder<SearchProductBloc, SearchProductState>(
                  builder: (context, state) {
                //LOADING STATE
                if (state.blocsStates == BlocsStates.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                //ERROR STATE
                if (state.blocsStates == BlocsStates.error) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                //LOADED STATE
                if (state.blocsStates == BlocsStates.loaded) {
                  return Center(
                      child: state.searchResults.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.searchResults.length,
                              itemBuilder: (context, index) {
                                var product = state.searchResults[index];
                                return ListTile(
                                  title: Text(product.title.toString()),
                                );
                              })
                          : const Text('found nothing'));
                }
                //INTIAL STATE
                if (state.blocsStates == BlocsStates.intial) {
                  return const Center(
                    child: Text('initial state'),
                  );
                }

                return const Center(
                  child: Text('unknown Error'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
