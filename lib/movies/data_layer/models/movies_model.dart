import 'package:animatedmovies/movies/domain_layer/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.id,
      required super.title,
      required super.backDropPath,
      required super.geneIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

   factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      id: json['id'],
      title: json['title'],
      backDropPath: json['backdrop_path'],
      geneIds: List<int>.from(json['genre_ids'].map((e)=>e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']);
}
