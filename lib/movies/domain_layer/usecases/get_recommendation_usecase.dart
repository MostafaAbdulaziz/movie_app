import 'package:animatedmovies/core/error/failure.dart';
import 'package:animatedmovies/core/utils/base_use_case.dart';
import 'package:animatedmovies/movies/domain_layer/entities/recommendation.dart';
import 'package:animatedmovies/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameters) async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }

}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter(this.id);

  @override
  List<Object?> get props => [id];
}
