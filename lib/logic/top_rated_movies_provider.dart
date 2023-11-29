import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_flix/constants/constants.dart';
import 'package:movie_flix/data/models/movie.dart';

// calls top rated movies api and provides List<Movies>
final topRatedProvider = FutureProvider((ref) async {
  const apiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed";

  try {
    // this contains json of results key in json
    final List<Map<String, dynamic>> detailMovieMap = [];
    //this will store deserialized json
    List<Movie> movies = [];
    final response = await Constants.dio.get(apiUrl);
    if (response.statusCode == 200) {
      //success
      final data = response.data;
      //contains Map of all top rated smovies
      final List responseList = data["results"];
      for (var element in responseList) {
        //again calling different url as the above Map doesn't contains duration key of movie
        //impacts loading time
        final detailResponse = await Constants.dio.get(
            "https://api.themoviedb.org/3/movie/${element["id"]}?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed");
        //fetches the detailed movie map using id of movie from url
        final data = detailResponse.data;
        detailMovieMap.add(data);
      }
      // deserialize the json
      movies = detailMovieMap.map((map) {
        Movie movie = Movie.fromMap(map);
        return movie;
      }).toList();
      return movies;
    } else {
      throw Exception(response.statusMessage);
    }
  } on DioException catch (e) {
    if (e.error is SocketException) {
      throw const SocketException('No Internet Connection');
    } else {
      throw Exception(e.message);
    }
  }
});
