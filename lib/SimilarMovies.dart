// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:finalproject/MoviesGrid.dart';
import 'package:finalproject/data/datasource/remote/constants.dart';
import 'package:finalproject/data/model/MovieResponse.dart';

import 'MovieInfo.dart';
import 'data/datasource/local/ctaegories.dart';
import 'data/datasource/remote/APIService.dart';

class SimilarMovies extends StatelessWidget {
  final Results currentMovie;

  const SimilarMovies(this.currentMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieResponse>(
      future: currentMovie.id != null
          ? APIService.api.fetchSimilarMovies(currentMovie.id!)
          : Future.value(null),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final similarMoviesResponse = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: similarMoviesResponse.results!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final similarMovie = similarMoviesResponse.results![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieInfo(similarMovie),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: FadeInImage.assetNetwork(
                          width: 150,
                          height: 150,
                          placeholder: 'assets/images/tab1.png',
                          image: '$imageURL/${similarMovie.posterPath}',
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.asset('assets/images/tab1.png'),
                            );
                          },
                        ),
                      ),
                      Text(similarMovie.title ?? ''),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}