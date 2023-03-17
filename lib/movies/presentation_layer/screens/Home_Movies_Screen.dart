import 'package:animatedmovies/core/utils/services_locator.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_bloc.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_events.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//test of Bloc
class HomeMoviesScreen extends StatelessWidget {
  const HomeMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            MoviesBloc(getIt(),getIt(),getIt())..add(GetNowPlayingMoviesEvent()),
        child: BlocBuilder<MoviesBloc,MoviesState>(
          builder: (context,state)=>const Scaffold(
            body: Center(
              child: Text('Mostafa'),
            ),
          ),
        ));
  }
}
