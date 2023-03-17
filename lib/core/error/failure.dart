abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure{
  ServerFailure(super.message);

}

class DatabaseException extends Failure{
  DatabaseException(super.message);

}