// TODO Implement this library.
import 'package:flutter/material.dart';

import 'custom_app_bar.dart.';
import 'data/datasource/remote/constants.dart';
import 'data/model/MovieResponse.dart';

class MoviesList extends StatelessWidget {
  final List<Results> movieList;
  final void Function(Results) navigateToMovie;

  const MoviesList(this.movieList, this.navigateToMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.separated(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return ListTile(
            onTap: () {
              navigateToMovie(movie);
            },
            leading: Image.network(
              "$imageURL${movie.posterPath}",
            ),
            title: Text(
              "${movie.title} (${movie.releaseDate?.split("-")[0]})",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text("Rate: ${movie.voteAverage} ⭐"),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}