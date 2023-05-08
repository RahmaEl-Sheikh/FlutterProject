import 'package:flutter/material.dart';
import 'package:finalproject/MovieInfo.dart';
import 'package:finalproject/data/datasource/local/ctaegories.dart';
import 'package:finalproject/data/datasource/remote/APIService.dart';
import 'package:finalproject/data/datasource/remote/constants.dart';
import 'package:finalproject/data/model/MovieResponse.dart';
import 'package:finalproject/MoviesGrid.dart';
import 'package:finalproject/MoviesList.dart';

import 'bottom_nav_bar.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({Key? key}) : super(key: key);

  @override
  _MoviesTabState createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  void _navigateToMovie(Results response) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieInfo(response),
      ),
    );
  }

  Widget _buildCategory(String title, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        FutureBuilder<MovieResponse>(
          future: APIService.api.fetchMoviesInfo(category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MoviesGrid(snapshot.data!.results!, _navigateToMovie);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategory('Now Playing', categories[0]),
            _buildCategory('Top Rated', categories[1]),
            _buildCategory('Popular', categories[2]),
          ],
        ),
      ),
    );
  }
}