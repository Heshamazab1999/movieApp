import 'package:dio/dio.dart';
import 'package:movie/model/film_model.dart';
import 'package:movie/model/person_model.dart';

class FilmServices {
  final String apiKey = "c497eb42890297baf158ca290345ed11";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getTopRatedUrl = '$mainUrl/movie/top_rated';
  var getUpComingUrl = '$mainUrl/movie/upcoming';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getPopularUrl = "$mainUrl/movie/popular";
  var getPersonsUrl = "$mainUrl/trending/person/week";
  var movieUrl = "$mainUrl/movie";

  Future<List<MovieModel>> getTopRateMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getTopRatedUrl, queryParameters: params);

      Iterable list = response.data["results"];
      return list.map((e) => MovieModel.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  Future<List<MovieModel>> getPopularMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 5};
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);

      Iterable list = response.data["results"];
      return list.map((e) => MovieModel.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Person>> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response = await _dio.get(getPersonsUrl, queryParameters: params);
      Iterable list = response.data["results"];
      return list.map((e) => Person.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  } Future<List<MovieModel>> getUpComing() async {
    var params = {"api_key": apiKey};
    try {
      Response response = await _dio.get(getUpComingUrl, queryParameters: params);
      print("kkkkk");
      print(response.data);
      Iterable list = response.data["results"];
      return list.map((e) => MovieModel.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  // Future<Video> getMovieVideos(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response = await _dio.get(movieUrl + "/$id" + "/videos",
  //         queryParameters: params);
  //     print(response.data);
  //     return Video.fromJson(response.data['results'][2]);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<Person> getPersons() async {
  //   var params = {"api_key": apiKey};
  //   try {
  //     Response response =
  //         await _dio.get(getPersonsUrl, queryParameters: params);
  //     return Person.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //   }
  // }
}
