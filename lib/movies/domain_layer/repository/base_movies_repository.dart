import 'package:animatedmovies/core/error/failure.dart';
import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies_detail.dart';
import 'package:animatedmovies/movies/domain_layer/entities/recommendation.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_recommendation_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNonPaying();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetail>> getMoviesDetails(
      MoviesDetailParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameter parameters);
}
