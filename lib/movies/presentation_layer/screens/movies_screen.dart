import 'package:animatedmovies/core/utils/services_locator.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_bloc.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_events.dart';
import 'package:animatedmovies/movies/presentation_layer/widgets/top_rated_widget.dart';
import 'package:animatedmovies/movies/presentation_layer/widgets/now_playing_widget.dart';
import 'package:animatedmovies/movies/presentation_layer/widgets/popular_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedWidget(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
