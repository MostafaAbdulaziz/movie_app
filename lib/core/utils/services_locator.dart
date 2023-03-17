import 'package:animatedmovies/movies/data_layer/data_sources/movies_remote_data_source.dart';
import 'package:animatedmovies/movies/data_layer/repository/repository_movies.dart';
import 'package:animatedmovies/movies/domain_layer/repository/base_movies_repository.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_movies_details_usecase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_nonplaying_usercase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_popular_usercase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_recommendation_usecase.dart';
import 'package:animatedmovies/movies/domain_layer/usecases/get_top_rated_usecase.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/movies_details_bloc/movies_details_bloc.dart';
import 'package:animatedmovies/movies/presentation_layer/controller/movies_bloc/nowplayingmovies_bloc/nowplayingmovies_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServerLocator {
  void init() {

    //Get now playing bloc
    getIt.registerFactory(() => MoviesBloc(getIt(),getIt(),getIt()));
    getIt.registerFactory(() => MoviesDetailsBloc(getIt(),getIt()));

    //use case
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRateMoviesUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMoviesDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationUseCase(getIt()));

    //repository
    getIt.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(getIt()));

    //data source
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());


  }
}
