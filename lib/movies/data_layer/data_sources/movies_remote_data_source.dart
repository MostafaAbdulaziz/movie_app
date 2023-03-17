import 'package:animatedmovies/core/error/movies_error.dart';
import 'package:animatedmovies/core/network/movies_network/apiconstantsmovies.dart';
import 'package:animatedmovies/core/network/movies_network/error_message_model.dart';
import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/movies/data_layer/models/movies_details_model.dart';
import 'package:animatedmovies/movies/data_layer/models/movies_model.dart';
import 'package:animatedmovies/movies/data_layer/models/recommendation_model.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_recommendation_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameter parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstantsMovies.nowPayingPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    var response = await Dio().get(ApiConstantsMovies.popularPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    var response = await Dio().get(ApiConstantsMovies.topRatedPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailParameters parameters) async {
    final result = await Dio()
        .get(ApiConstantsMovies.moviesDetailsPath('${parameters.moviesId}'));
    if (result.statusCode == 200) {
      print(result.data);
      return MoviesDetailsModel.fromJson(result.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameter parameters) async {
    final result = await Dio().get(ApiConstantsMovies.recommendationPath(parameters.id.toString()));
    if (result.statusCode == 200) {
      return List<RecommendationModel>.from((result.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(result.data));
    }
  }
}
