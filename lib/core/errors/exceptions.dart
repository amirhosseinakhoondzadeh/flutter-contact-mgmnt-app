import 'package:a_job_thing_test/core/constants/constants.dart';

class ServerException implements Exception {
  final String message;

  ServerException({this.message = AppConstants.DEFAULT_ERROR_MESSAGE});

  @override
  String toString() {
    return message;
  }
}
