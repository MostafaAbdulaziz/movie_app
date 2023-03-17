import 'package:equatable/equatable.dart';

class MoviesDetailParameters extends Equatable{
  final int moviesId;
  const MoviesDetailParameters({required this.moviesId});

  @override
  List<Object?> get props => [moviesId];

}

class NoParameters extends Equatable{
  const NoParameters();

  @override
  List<Object?> get props => [];
}