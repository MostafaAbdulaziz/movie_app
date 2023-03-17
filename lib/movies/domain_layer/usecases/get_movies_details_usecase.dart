import 'package:animatedmovies/core/error/failure.dart';
import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/core/utils/base_use_case.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies_detail.dart';
import 'package:animatedmovies/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MoviesDetail,MoviesDetailParameters>{
  BaseMoviesRepository? baseMoviesRepository;
  GetMoviesDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure,MoviesDetail>> call(MoviesDetailParameters parameters )async{
    return await baseMoviesRepository!.getMoviesDetails(parameters);
  }
}