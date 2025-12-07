import 'package:absolute_cinema/screens/home/home_screen.dart';
import 'package:absolute_cinema/screens/movie/movie_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:absolute_cinema/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => HomeScreen(),
        '/movie-list': (context) => MovieListScreen(),
      },
      initialRoute: '/',
    );
  }
}
