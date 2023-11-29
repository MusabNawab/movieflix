import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_flix/data/models/movie.dart';

import '../logic/now_playing_provider.dart';
import '../logic/top_rated_movies_provider.dart';

class Constants {
  static final dio = Dio();
  static final appColor = Colors.orange.shade300;
  static const secondaryColor = Color.fromARGB(255, 250, 189, 98);
  static const error = "assets/images/error.json";
  static const placeholderImg = "assets/images/placeholder.png";
  static const noInternet = 'assets/images/no_internet-2.json';
  static final List movieProvider = [nowPlayingProvider, topRatedProvider];

  static final List<Movie> dummyData = [
    Movie(
        id: 901362,
        title: 'Trolls Band Together',
        poster: '/sEaLO9s7CIN3fjz8R3Qksum44en.jpg',
        overview:
            'When Branch\'s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains.',
        duration: '01:32',
        voteCount: 205,
        voteAverage: 7.107,
        releaseDate: '2023-10-12'),
    Movie(
        id: 1075794,
        title: 'Leo',
        poster: '/pD6sL4vntUOXHmuvJPPZAgvyfd9.jpg',
        overview:
            'Jaded 74-year-old lizard Leo has been stuck in the same Florida classroom for decades with his terrarium-mate turtle.',
        duration: '01:42',
        voteCount: 254,
        voteAverage: 7.9,
        releaseDate: '2023-11-17'),
    Movie(
        id: 901362,
        title: 'Trolls Band Together',
        poster: '/sEaLO9s7CIN3fjz8R3Qksum44en.jpg',
        overview:
            'When Branch\'s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains.',
        duration: '01:32',
        voteCount: 205,
        voteAverage: 7.107,
        releaseDate: '2023-10-12'),
    Movie(
        id: 1075794,
        title: 'Leo',
        poster: '/pD6sL4vntUOXHmuvJPPZAgvyfd9.jpg',
        overview:
            'Jaded 74-year-old lizard Leo has been stuck in the same Florida classroom for decades with his terrarium-mate turtle.',
        duration: '01:42',
        voteCount: 254,
        voteAverage: 7.9,
        releaseDate: '2023-11-17'),
    Movie(
        id: 901362,
        title: 'Trolls Band Together',
        poster: '/sEaLO9s7CIN3fjz8R3Qksum44en.jpg',
        overview:
            'When Branch\'s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains.',
        duration: '01:32',
        voteCount: 205,
        voteAverage: 7.107,
        releaseDate: '2023-10-12'),
  ];
}
