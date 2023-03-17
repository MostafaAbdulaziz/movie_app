import 'package:animatedmovies/core/error/failure.dart';
import 'package:animatedmovies/core/error/movies_error.dart';
import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/movies/data_layer/data_sources/movies_remote_data_source.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies_detail.dart';
import 'package:animatedmovies/movies/domain_layer/entities/recommendation.dart';
import 'package:animatedmovies/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_recommendation_usecase.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNonPaying() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, MoviesDetail>> getMoviesDetails(
      MoviesDetailParameters parameters) async {
      final result=await baseRemoteDataSource.getMoviesDetails(parameters);
    try {
      print(result);
      return Right(result);
    } on ServerException catch (failure) {
      print(failure.toString());
      return Left(ServerFailure(failure.errorMessageModel.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameter parameters) async {
    final result = await baseRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusCode));
    }
  }
}
