import 'package:flutter/material.dart';
import 'package:finalproject/data/model/TVResponse.dart';

import 'data/datasource/remote/constants.dart';

class TVGridCard extends StatelessWidget {
  final TVResults tvShow;

  const TVGridCard(this.tvShow, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Image.network(
            "$imageURL${tvShow.posterPath}",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "${tvShow.name} (${tvShow.firstAirDate?.split("-")[0] ?? 'N/A'})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "Rate: ${tvShow.voteAverage} ⭐",
              ),
            ],
          ),
        ),
      ],
    );
  }
}