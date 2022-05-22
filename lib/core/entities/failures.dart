import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class UserNotFoundFailure extends Failure {
  @override
  List<Object> get props => [];
}

class SomethingWentWrong extends Failure {
  SomethingWentWrong({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}
