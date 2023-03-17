import 'package:animatedmovies/core/error/failure.dart';
import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies.dart';
import 'package:animatedmovies/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/utils/base_use_case.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

@override
  Future<Either<Failure,List<Movies>>> call(NoParameters parameters)async{
  return await baseMoviesRepository.getNonPaying();
}

}