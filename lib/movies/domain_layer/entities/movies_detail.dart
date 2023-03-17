import 'package:animatedmovies/movies/domain_layer/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MoviesDetail extends Equatable {
  final String backdropPath;
  final String overview;
  final String releaseData;
  final double voteAverage;
  final String title;
  final int id;
  final int runtime;
  final List<Genres> genres;

  const MoviesDetail({
    required this.voteAverage,
    required this.overview,
    required this.title,
    required this.id,
    required this.backdropPath,
    required this.releaseData,
    required this.runtime,
    required this.genres,
  });

  @override
  List<Object?> get props =>
      [backdropPath, overview, releaseData, voteAverage, title, id, runtime];
}
