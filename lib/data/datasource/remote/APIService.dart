import 'package:dio/dio.dart';
import 'package:finalproject/data/datasource/remote/config.dart';
import 'package:finalproject/data/datasource/remote/constants.dart';
import 'package:finalproject/data/model/MovieResponse.dart';

import '../../model/TVResponse.dart';

class APIService {
  APIService._();
  static final APIService api = APIService._();

  Future<MovieResponse> fetchMoviesInfo(String category) async {
    String url = category.replaceAll(" ", "_").toLowerCase();
    Dio dio = MovieConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<MovieResponse> fetchSimilarMovies(int currentMovieID) async {
    String url = "$currentMovieID/similar";
    Dio dio = MovieConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<TVResponse> fetchSimilarTVShows(int currentTVShowID) async {
    String url = "$currentTVShowID/similar";
    Dio dio = TVConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return TVResponse.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }

  Future<TVResponse> fetchTVInfo(String category) async {
    String url = category.replaceAll(" ", "_").toLowerCase();
    Dio dio = TVConfig.getDio();
    Map<String, dynamic> params = {"api_key": api_key};
    Response response = await dio.get(url, queryParameters: params);
    if (response.statusCode == 200) {
      return TVResponse.fromJson(response.data);
    } else {
      throw Exception("Unable to get Movies info from DB");
    }
  }
}
