import 'package:animatedmovies/core/utils/base_use_case.dart';
import 'package:animatedmovies/core/utils/services_locator.dart';
import 'package:animatedmovies/movies/presentation_layer/screens/splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/utils/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding();
  ServerLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
