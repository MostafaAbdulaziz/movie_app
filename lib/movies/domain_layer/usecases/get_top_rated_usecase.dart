import 'package:animatedmovies/core/error/failure.dart';
import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/core/utils/base_use_case.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies.dart';
import 'package:animatedmovies/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRateMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRateMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movies>>> call(NoParameters parameters)async{
    return await baseMoviesRepository.getTopRatedMovies();
  }

}