import 'package:flutter/material.dart';
import 'package:finalproject/TVGrid.dart';
import 'package:finalproject/TVInfo.dart';

import 'data/datasource/local/ctaegories.dart';
import 'data/datasource/remote/APIService.dart';
import 'data/model/TVResponse.dart';
Widget TvTab() {
  return const Center(
    child: Text('TV Shows'),
  );
}

class TVTab extends StatefulWidget {
  const TVTab({Key? key}) : super(key: key);

  @override
  _TVTabState createState() => _TVTabState();
}

class _TVTabState extends State<TVTab> {
  void _navigateToTVShow(TVResults response) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TVInfo(response),
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
        FutureBuilder<TVResponse>(
          future: APIService.api.fetchTVInfo(category),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TVGrid(snapshot.data!.results!, _navigateToTVShow);
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
            _buildCategory('Airing Today', categories[3]),
            _buildCategory('Top Rated', categories[1]),
            _buildCategory('Popular', categories[2]),
          ],
        ),
      ),
    );
  }
}