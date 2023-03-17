import 'package:animatedmovies/core/network/movies_network/resquest_states.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.topRatedMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading});

  MoviesState copyWith({
     List<Movies>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<Movies>? popularMovies,
     RequestState? popularState,
     String? popularMessage,
     List<Movies>? topRatedMovies,
     RequestState? topRatedState,
     String? topRatedMessage,
  }) =>
      MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      );

  @override
  List<Object?> get props =>
      [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMessage,
        popularMovies,
        popularState,
        topRatedMessage,
        topRatedMovies,
        topRatedState
      ];
}
