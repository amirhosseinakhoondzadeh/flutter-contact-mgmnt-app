import 'dart:convert';

import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/core/errors/exceptions.dart';
import 'package:a_job_thing_test/data/models/basic_info.dart';
import 'package:a_job_thing_test/data/models/experience.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class RemoteDataSource {
  Future<List<BasicInfo>> fetchBasicInfoList();
  Future<List<Experience>> fetchExperienceList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({@required this.client});

  @override
  Future<List<BasicInfo>> fetchBasicInfoList() async {
    final url = "${AppConstants.BASE_URL}${AppConstants.BASIC_INFO_URL}";
    print("url is : $url");
    try {
      final response = await client.get(
        url,
      );

      final jsonResponse = json.decode(response.body);
      print("Basic Info Response : $jsonResponse");

      if (response.statusCode == 200 && (jsonResponse is List)) {
        final data = jsonResponse == null
            ? null
            : jsonResponse
                .map<BasicInfo>((e) => BasicInfo.fromJson(e) ?? null)
                .toList();
        return data;
      } else {
        final String error = jsonResponse.contains("error");
        throw ServerException(message: error);
      }
    } catch (e) {
      print("${e.toString()}");
      throw ServerException();
    }
  }

  @override
  Future<List<Experience>> fetchExperienceList() async {
    final url = "${AppConstants.BASE_URL}${AppConstants.EXPERIENCE_URL}";
    print("url is : $url");
    try {
      final response = await client.get(
        url,
      );

      final jsonResponse = json.decode(response.body);
      print("Experience Response : $jsonResponse");

      if (response.statusCode == 200 && (jsonResponse is List)) {
        final data = jsonResponse == null
            ? null
            : jsonResponse
                .map<Experience>((e) => Experience.fromJson(e) ?? null)
                .toList();
        return data;
      } else {
        final String error = jsonResponse.contains("error");
        throw ServerException(message: error);
      }
    } catch (e) {
      print("${e.toString()}");
      throw ServerException();
    }
  }
}
