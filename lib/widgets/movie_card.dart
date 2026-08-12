import 'package:flutter/material.dart';

import '../core/constants/apiconstant.dart';
import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          '${ApiConstant.imageBaseUrl}${movie.posterPath}',
          width: 120,
          height: 180,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 120,
              height: 180,
              color: Colors.grey.shade900,
              child: const Icon(
                Icons.movie,
                color: Colors.white,
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}