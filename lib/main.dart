import 'package:absolute_cinema/data/models/movie_model.dart';
import 'package:absolute_cinema/screens/home/home_screen.dart';
import 'package:absolute_cinema/screens/movie/movie_detail_screen.dart';
import 'package:absolute_cinema/screens/movie/movie_list_screen.dart';
import 'package:absolute_cinema/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/movie-list':
            return MaterialPageRoute(builder: (_) => MovieListScreen());
          case '/movie-detail':
            final movie = settings.arguments as Movie?;
            if (movie == null) {
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(),
                  body: const Center(child: Text('Movie not found')),
                ),
              );
            }
            return MaterialPageRoute(
              builder: (_) => MovieDetailScreen(movie: movie),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(),
                body: const Center(child: Text('Route not found')),
              ),
            );
        }
      },
      initialRoute: '/',
    );
  }
}
