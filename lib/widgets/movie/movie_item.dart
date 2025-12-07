import 'package:absolute_cinema/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Card(child: Text("Hello World!"));
  }
}
