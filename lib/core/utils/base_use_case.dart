import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseUseCase<T,parameters>{
  Future<Either<Failure,T>> call(parameters parameters);
}

