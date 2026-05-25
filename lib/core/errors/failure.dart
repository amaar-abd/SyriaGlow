class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  final String? code;
  ServerFailure({this.code, required super.message});
}
