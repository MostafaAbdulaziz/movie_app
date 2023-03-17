import 'dart:async';

import 'package:animatedmovies/core/network/movies_network/movies_detail_paramiter.dart';
import 'package:animatedmovies/core/network/movies_network/resquest_states.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_nonplaying_usercase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_popular_usercase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_top_rated_usecase.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_events.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_states.dart';
import 'package:bloc/bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRateMoviesUseCase getTopRateMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRateMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingData);
    on<GetPopularMoviesEvent>(getPopularData);
    on<GetTopRatedMoviesEvent>(getTopRateData);
  }


  FutureOr<void> getNowPlayingData(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async{

      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
              (l) => emit(
            state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message),
          ),
              (r) => emit(
            state.copyWith(
              nowPlayingState: RequestState.loaded,
              nowPlayingMovies: r,
            ),
          ));

  }

  FutureOr<void> getPopularData(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(
          state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message),
        ),
            (r) => emit(
          state.copyWith(
              popularMovies: r, popularState: RequestState.loaded),
        ));
  }

  FutureOr<void> getTopRateData(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRateMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(
          state.copyWith(
              topRatedMessage: l.message,
              topRatedState: RequestState.loaded),
        ),
            (r) => emit(
          state.copyWith(
              topRatedState: RequestState.loaded, topRatedMovies: r),
        ));
  }
}


