import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/movie.dart';

//listens to the text entered in search box and returns that text
final searchQueryProvider = StateProvider<String>((ref) => '');

//proivder
final searchControllerProvider =
    StateNotifierProvider<SearchUserController, List<Movie>>((ref) {
  return SearchUserController();
});

// returns the searched movie else empty
class SearchUserController extends StateNotifier<List<Movie>> {
  SearchUserController() : super([]);

  void onSearchUser(String query, List<Movie> data) {
    if (query.isEmpty) {
      state = [];
    } else {
      final result = data
          .where((element) => element.title
              .toLowerCase()
              .replaceAll(' ', '')
              .contains(query.toLowerCase().replaceAll(' ', '')))
          .toList();
      state = result;
    }
  }
}
