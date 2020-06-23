import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final String failureMessage;

  const ServerFailure({this.failureMessage});

  @override
  String get message => failureMessage ?? AppConstants.DEFAULT_ERROR_MESSAGE;
}

class InternetFailure extends Failure {
  @override
  String get message => AppConstants.NO_INTERNET_CONNECTION_FAILURE;
}

class CustomFailure extends Failure {
  final String failureMessage;

  const CustomFailure(this.failureMessage);

  @override
  String get message => failureMessage;
}
