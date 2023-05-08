import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'data/datasource/remote/constants.dart';
import 'data/model/TVResponse.dart';

class TVList extends StatelessWidget {
  const TVList(this.tvShows, this.navigateToTVShow, {Key? key})
      : super(key: key);

  final List<TVResults> tvShows;
  final void Function(TVResults) navigateToTVShow;

  Widget _buildTVShowList(BuildContext context, int index) {
    final tvShow = tvShows[index];
    return ListTile(
      onTap: () => navigateToTVShow(tvShow),
      leading: Image.network(
        "$imageURL${tvShow.posterPath}",
      ),
      title: Text(
        "${tvShow.name} (${tvShow.firstAirDate?.split("-")[0]})",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text("Rate: ${tvShow.voteAverage} ⭐"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(),
      body: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tvShows.length,
          itemBuilder: _buildTVShowList,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}