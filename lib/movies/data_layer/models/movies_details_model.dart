import 'package:animatedmovies/movies/data_layer/models/genres_model.dart';
import 'package:animatedmovies/movies/domain_layer/entities/movies_detail.dart';

class MoviesDetailsModel extends MoviesDetail {
  const MoviesDetailsModel(
      {required super.voteAverage,
      required super.overview,
      required super.title,
      required super.id,
      required super.backdropPath,
      required super.releaseData,
      required super.runtime,
      required super.genres,
      });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
          voteAverage: json['vote_average'],
          overview: json['overview'],
          title: json['title'],
          id: json['id'],
          backdropPath: json['backdrop_path'],
          releaseData: json['release_date'],
          runtime: json['runtime'],
          genres: List<GenresModel>.from(json['genres'].map((element)=>GenresModel.fromJson(element))),
      );
}
