import 'package:animatedmovies/core/network/movies_network/resquest_states.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies_detail.dart';
import 'package:animatedmovies/movies/domain_layer/entities/recommendation.dart';
import 'package:equatable/equatable.dart';

class MoviesDetailsStates extends Equatable {
  const MoviesDetailsStates(
      {this.moviesDetails,
      this.moviesDetailsState = RequestState.loading,
      this.message = '',
      this.recommendation = const [],
      this.recommendationRequestState = RequestState.loading,
      this.recommendationMessage = ''});

  final MoviesDetail? moviesDetails;
  final RequestState moviesDetailsState;
  final String message;
  final List<Recommendation> recommendation;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  MoviesDetailsStates copyWith({
    MoviesDetail? moviesDetails,
    RequestState? requestState,
    String? message,
    List<Recommendation>? recommendation,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) =>
      MoviesDetailsStates(
          moviesDetails: moviesDetails ?? this.moviesDetails,
          message: message ?? this.message,
          moviesDetailsState: requestState ?? this.moviesDetailsState,
          recommendation: recommendation ?? this.recommendation,
          recommendationMessage:
              recommendationMessage ?? this.recommendationMessage,
          recommendationRequestState:
              recommendationRequestState ?? this.recommendationRequestState);

  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsState,
        message,
        recommendation,
        recommendationMessage,
        recommendationRequestState
      ];
}
