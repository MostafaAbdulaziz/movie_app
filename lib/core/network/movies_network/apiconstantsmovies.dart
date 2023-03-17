import 'package:animatedmovies/movies/domain_layer/entities/movies_detail.dart';

class ApiConstantsMovies {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '160bc11ab739cf897a283b3574504a70';
  static const String nowPayingPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String moviesDetailsPath(String moviesId) =>
      '$baseUrl/movie/$moviesId?api_key=$apiKey';

  static String recommendationPath(String moviesId) =>
      '$baseUrl/movie/$moviesId/recommendations?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
