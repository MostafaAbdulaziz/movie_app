import 'package:equatable/equatable.dart';

class Movies extends Equatable{
  final int id;
  final String title;
  final String backDropPath;
  final List<int> geneIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movies(
      {required this.id,
      required this.title,
      required this.backDropPath,
      required this.geneIds,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate,
      });

  @override
  List<Object?> get props => [id,title,backDropPath,geneIds,overview,voteAverage,releaseDate];




}
