import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 450,
  width: double.infinity,
  child: Image.network(
    'https://image.tmdb.org/t/p/original${movie.backdropPath}',
    fit: BoxFit.cover,
  ),
            )
          ],
        ),
      ),
    );
  }
}