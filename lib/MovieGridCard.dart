import 'package:flutter/material.dart';

import 'data/datasource/remote/constants.dart';
import 'data/model/MovieResponse.dart';

class MovieGridCard extends StatelessWidget {
  final Results movie;

  const MovieGridCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Image.network(
            "$imageURL${movie.posterPath}",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "${movie.title} (${movie.releaseDate?.split("-")[0]})",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Rate: ${movie.voteAverage} ⭐",
        ),
      ],
    );
  }
}