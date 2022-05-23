import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

Failure failurefromDioError(DioError dioError) {
  if (dioError.response == null) {
    return SomethingWentWrong();
  }

  if (dioError.response!.statusCode == 404) {
    return NotFoundedFailure();
  }
  if (dioError.response!.statusCode == 403) {
    return TooManyAttemptsFailure();
  }

  return SomethingWentWrong(
    message: dioError.response!.statusMessage,
  );
}

class NotFoundedFailure extends Failure {
  @override
  List<Object> get props => [];
}

class SomethingWentWrong extends Failure {
  SomethingWentWrong({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class TooManyAttemptsFailure extends Failure {
  TooManyAttemptsFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}
