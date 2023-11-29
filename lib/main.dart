//The bottomNavigationBar on Android doesn't stay like iOS after going to new screen
// See : https://stackoverflow.com/a/49647622/15600883

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_flix/constants/constants.dart';
import 'package:movie_flix/presentation/HomeScreen/homescreen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Flick',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Constants.appColor),
        scaffoldBackgroundColor: Constants.appColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Constants.secondaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
