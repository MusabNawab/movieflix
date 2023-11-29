import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_flix/constants/constants.dart';
import 'package:movie_flix/data/models/movie.dart';
import 'package:movie_flix/logic/search_provider.dart';
import 'package:movie_flix/logic/top_rated_movies_provider.dart';
import 'package:movie_flix/presentation/HomeScreen/widgets/error_widget.dart';
import 'package:movie_flix/presentation/HomeScreen/widgets/movie_skeleton.dart';
import 'package:movie_flix/presentation/HomeScreen/widgets/movie_tiles.dart';
import 'package:movie_flix/presentation/HomeScreen/widgets/refresh_container.dart';

import '../../../logic/now_playing_provider.dart';

class MovieList extends ConsumerStatefulWidget {
  const MovieList({super.key, required this.provider});

  final FutureProvider<List<Movie>?> provider;
  @override
  ConsumerState<MovieList> createState() => _MovieListState();
}

class _MovieListState extends ConsumerState<MovieList> {
  @override
  Widget build(BuildContext context) {
    final filteredList =
        ref.watch(searchControllerProvider); // listening to searchProvider
    final asyncData = ref.watch(
        widget.provider); // listening to provider movie/top rated provider

    return RefreshIndicator(
      onRefresh: () async {
        // refresh data
        ref.refresh(widget.provider);
      },
      child: asyncData.when(
        data: (data) {
          // display data based on search query,if empty then show movie list
          List<Movie> movies = filteredList.isNotEmpty ? filteredList : data!;
          if (data != null) {
            //remove movie from list
            void removeMovie(Movie movie, int index) {
              data.remove(movie);
              movies.remove(movie);
              setState(() {});
            }

            return Stack(
              children: [
                //Widget list of movies
                ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: ValueKey(movies[index].id),
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          //remove movie after sliding left
                          removeMovie(movies[index], index);
                        }),
                        children: [
                          SlidableAction(
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            onPressed: (_) {
                              //remove movie after tapping delete icon
                              removeMovie(movies[index], index);
                            },
                          )
                        ],
                      ),
                      child: MovieTiles(
                        movie: movies[index],
                      ),
                    );
                  },
                ),
                //if data is refreshing show refresh indicator
                asyncData.isRefreshing
                    ? const RefreshContainer()
                    : const SizedBox(),
              ],
            );
          }
          //Some exception occured
          return const Center(
            child: Text("No data"),
          );
        },
        error: (error, stackTrace) {
          // if there is no internet the show no internet on screen
          if (error is SocketException) {
            return ErrorAnimation(
              Constants.noInternet,
              'No Internet',
              TextButton.icon(
                onPressed: () {
                  ref.refresh(nowPlayingProvider);
                  ref.refresh(topRatedProvider);
                },
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Refresh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }
          //Some other exception occured
          return const ErrorAnimation(
            Constants.error,
            'Something Went Wrong!',
            SizedBox(),
          );
        },
        loading: () => const MovieSkeleton(),
      ),
    );
  }
}
