import 'dart:async';

import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/core/network/movies_network/resquest_states.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_movies_details_usecase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_recommendation_usecase.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/movies_details_bloc/movies_details_events.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/movies_details_bloc/movies_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsStates> {
  MoviesDetailsBloc(this.getMoviesDetailsUseCase,this.getRecommendationUseCase)
      : super(const MoviesDetailsStates()) {
    on<GetMoviesDetailsEvent>(getMoviesDetails);
    on<GetMoviesRecommendationEvent>(getRecommendation);
  }

  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> getMoviesDetails(
      GetMoviesDetailsEvent event, Emitter<MoviesDetailsStates> emit) async {
    final result = await getMoviesDetailsUseCase(
        MoviesDetailParameters(moviesId: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            message: l.message, requestState: RequestState.error)),
        (r) => emit(state.copyWith(
            requestState: RequestState.loaded, moviesDetails: r)));
  }

  FutureOr<void> getRecommendation(
      GetMoviesRecommendationEvent event, Emitter<MoviesDetailsStates> emit) async{
    final result = await getRecommendationUseCase(
        RecommendationParameter(event.id));

    result.fold(
            (l) => emit(state.copyWith(
            recommendationMessage: l.message, recommendationRequestState: RequestState.error)),
            (r) => emit(state.copyWith(
            recommendationRequestState: RequestState.loaded, recommendation: r)));
  }
}
