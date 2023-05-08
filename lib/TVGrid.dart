import 'package:flutter/material.dart';
import 'package:finalproject/CustomGridCard.dart';

import 'TVGridCard.dart';
import 'TVList.dart';
import 'data/model/TVResponse.dart';

class TVGrid extends StatelessWidget {
  const TVGrid(this.tvShows, this.navigateToTVShow, {Key? key})
      : super(key: key);

  final List<TVResults> tvShows;
  final void Function(TVResults) navigateToTVShow;

  void _showMore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TVList(tvShows, navigateToTVShow),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shortList = tvShows.take(4).toList();
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
              onTap: () => navigateToTVShow(shortList[index]),
              child: TVGridCard(shortList[index]),
            );
          }
        },
      ),
    );
  }
}