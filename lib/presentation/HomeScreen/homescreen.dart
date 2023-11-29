import 'package:flutter/material.dart';
import 'package:movie_flix/logic/now_playing_provider.dart';
import 'package:movie_flix/logic/top_rated_movies_provider.dart';
import 'package:movie_flix/presentation/widgets/app_bar.dart';
import '../../constants/constants.dart';
import 'widgets/movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bottomNavigation page index
  int _selectedIndex = 0;

  void updateIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgets = [
      MovieList(provider: nowPlayingProvider),
      MovieList(provider: topRatedProvider)
    ];
    return Scaffold(
        appBar: MyAppBar(provider: Constants.movieProvider[_selectedIndex]),
        body: widgets[_selectedIndex], //return page based on index
        bottomNavigationBar: BottomNavigationBar(
          key: UniqueKey(),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie_creation_outlined,
                  size: 35,
                ),
                label: 'Now Playing'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_outline,
                  size: 35,
                ),
                label: 'Top Rated'),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) {
            updateIndex(value);
          },
        ));
  }
}
