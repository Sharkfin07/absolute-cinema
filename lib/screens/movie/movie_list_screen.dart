import 'package:absolute_cinema/data/models/movie_model.dart';
import 'package:absolute_cinema/widgets/logo.dart';
import 'package:absolute_cinema/widgets/movie/movie_item.dart';
import 'package:absolute_cinema/widgets/movie/movie_loader.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    List<Movie> movieList = [];

    // Fetch here

    return Scaffold(
      appBar: AppBar(title: SmallLogo()),
      body: isLoading
          ? MovieLoader()
          : ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index) =>
                  MovieItem(movie: movieList[index]),
            ),
    );
  }
}
