class Movie {
  final int id;
  final String title;
  final String poster;
  final String overview;
  final String duration;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;

  Movie(
      {required this.id,
      required this.title,
      required this.poster,
      required this.overview,
      required this.duration,
      required this.voteAverage,
      required this.voteCount,
      required this.releaseDate});

  //converts json to Movie object
  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      poster: map['poster_path'] as String,
      overview: map['overview'] as String,
      duration: durationToString(map['runtime'] as int),
      voteAverage: map['vote_average'] * 10 as double,
      voteCount: map['vote_count'] as int,
      releaseDate: map['release_date'] as String,
    );
  }

  // method for adding hr and minutes in time string
  static String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, poster: $poster, overview: $overview, duration: $duration, voteCount: $voteCount,voteAverage: $voteAverage, releaseDate: $releaseDate)';
  }
}
