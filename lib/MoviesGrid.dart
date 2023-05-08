import 'package:flutter/material.dart';
import 'package:finalproject/MoviesList.dart';
import 'CustomGridCard.dart';
import 'MovieGridCard.dart';
import 'MovieInfo.dart';
import 'data/datasource/remote/constants.dart';
import 'data/model/MovieResponse.dart';

class MoviesGrid extends StatelessWidget {
  final List<Results> movieList;
  final void Function(Results) navigateToMovie;

  const MoviesGrid(this.movieList, this.navigateToMovie, {Key? key})
      : super(key: key);

  void _showMore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoviesList(movieList, navigateToMovie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shortList = movieList.take(4).toList();
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: shortList.length + 1,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 2 / 0.8,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          if (index == shortList.length) {
            return InkWell(
              onTap: () => _showMore(context),
              child: const CustomCard(),
            );
          } else {
            return InkWell(
              onTap: () => navigateToMovie(shortList[index]),
              child: MovieGridCard(shortList[index]),
            );
          }
        },
      ),
    );
  }
}