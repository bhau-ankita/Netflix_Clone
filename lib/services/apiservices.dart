import 'dart:developer';

import 'package:netflix_clone_3/common/utils.dart';
import 'package:netflix_clone_3/model/moviedetailedmodel.dart';
import 'package:netflix_clone_3/model/movierecommendationmovie.dart';
import 'package:netflix_clone_3/model/searchmodel.dart';
import 'package:netflix_clone_3/model/tvseriesmodel.dart';
import 'package:netflix_clone_3/model/upcomingmoviemodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key = $apiKey';
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = 'movie/upcoming';
    final String url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success ');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies');
  }

  Future<UpcomingMovieModel> getNowPlayingMovies() async {
    endPoint = 'movie/now_playing';
    final String url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success ');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load Now playing movies');
  }

  Future<TvModelSeries> getTopRatedSeries() async {
    endPoint = 'tv/1396/recommendations';
    final String url =
        'https://api.themoviedb.org/3/tv/1396/recommendations?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success ho rh hai ');
      return TvModelSeries.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load Top Rated Tv Series movies');
  }

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MGM3ZmY1YWE4Yzc0MGMwNWRhZjU5Y2NhYjExN2VhYiIsInN1YiI6IjY1ZjQzZDE2NTk1YTU2MDE4NjA2YzBmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ptCzyPknhRSLj9CA6-O7cgPq3bhn3qS0OHpp5kNOkeg'
    });
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log('success 2');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  search movie ');
  }

  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success 4 ');
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load Popular Movies movies');
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final String url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success 10 ');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<MovieRecommendationModel> getMovieRecommendation(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final String url =
        'https://api.themoviedb.org/3/movie/$movieId/recommendations=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Success 5');
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load Popular Movies movies');
  }
}
