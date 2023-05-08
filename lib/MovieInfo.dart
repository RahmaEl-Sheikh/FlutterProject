// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:finalproject/SimilarMovies.dart';
import 'package:finalproject/data/model/MovieResponse.dart';

import 'custom_app_bar.dart';
import 'data/datasource/remote/constants.dart';

class MovieInfo extends StatelessWidget {
  final Results movieInfo;

  const MovieInfo(this.movieInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 7),
              SizedBox(
                width: 280,
                child: Image.network("$imageURL${movieInfo.posterPath}"),
              ),
              Text(
                "${movieInfo.title}\n(${movieInfo.releaseDate})",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text("${movieInfo.voteAverage} ⭐"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${movieInfo.overview}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "You may also like",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SimilarMovies(movieInfo),
            ],
          ),
        ),
      ),
    );
  }
}