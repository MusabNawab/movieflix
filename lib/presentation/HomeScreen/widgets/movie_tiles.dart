import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_flix/presentation/DetailsScreen/details_screen.dart';

import '../../../data/models/movie.dart';

class MovieTiles extends StatelessWidget {
  const MovieTiles({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //tap to go to details screen
          InkWell(
            onTap: () {
              //Navigate to details screen
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen(movie: movie);
                },
              ));
            },
            //Layout
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  //Image
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w200/${movie.poster}',
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Movie title
                      Text(
                        movie.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Movie overview
                      Text(
                        movie.overview,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
