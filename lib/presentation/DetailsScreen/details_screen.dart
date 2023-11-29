import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_flix/data/models/movie.dart';
import 'package:movie_flix/presentation/DetailsScreen/widgets/text_with_icon.dart';

import '../../constants/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  //parse release date into Month Date,Year format
  String get releaseDate {
    final date = DateTime.parse(movie.releaseDate);
    return DateFormat("MMMM d,yyyy").format(date);
  }

  //add hr and min in front of movie duration
  String get duration {
    List<String> timeComponents = movie.duration.split(':');
    return '${timeComponents[0]} hr ${timeComponents[1]} mins';
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    //calculating bodysize of device
    final bodySize = mediaQuery.size.height - mediaQuery.padding.top - 65;
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            //fullscreen movie poster
            CachedNetworkImage(
              errorWidget: (context, url, error) =>
                  Center(child: LottieBuilder.asset(Constants.error)),
              imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.poster}',
              fit: BoxFit.cover,
              height: bodySize,
            ),
            //scrollable container that shows movie details
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: bodySize - 200,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.fromLTRB(10, 30, 25, 20),
                    color: Colors.black.withOpacity(0.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //movie title
                        Text(
                          movie.title,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //movie release date
                        Text(
                          releaseDate,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                          ),
                        ),
                        //movie votes and duration
                        Row(
                          children: [
                            TextWithIcon(
                              icon: Icons.cake,
                              text: movie.voteAverage.toStringAsFixed(2),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            TextWithIcon(icon: Icons.alarm, text: duration),
                          ],
                        ),
                        //movie overview
                        Text(
                          movie.overview,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
