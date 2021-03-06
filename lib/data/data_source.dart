import 'package:a_job_thing_test/core/errors/failures.dart';
import 'package:a_job_thing_test/core/network_info/network_info.dart';
import 'package:a_job_thing_test/data/models/address.dart';
import 'package:a_job_thing_test/data/models/basic_info.dart';
import 'package:a_job_thing_test/data/models/contact.dart';
import 'package:a_job_thing_test/data/models/experience.dart';
import 'package:meta/meta.dart';

import 'network_layer/remote_datasource.dart';

abstract class DataSource {
  Future<List<BasicInfo>> fetchAllCandidatesBasicInfo();
  Future<List<Experience>> fetchAllCandidatesExperience();
  Future<List<Contact>> fetchAllCandidatesContacts();
  Future<List<Address>> fetchAllCandidatesAddresses();
}

class DataSourceImpl implements DataSource {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DataSourceImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<List<BasicInfo>> fetchAllCandidatesBasicInfo() async {
    if (await networkInfo.isConnected()) {
      return await remoteDataSource.fetchBasicInfoList();
    } else {
      throw InternetFailure();
    }
  }

  @override
  Future<List<Experience>> fetchAllCandidatesExperience() async {
    if (await networkInfo.isConnected()) {
      return await remoteDataSource.fetchExperienceList();
    } else {
      throw InternetFailure();
    }
  }

  @override
  Future<List<Address>> fetchAllCandidatesAddresses() async {
    if (await networkInfo.isConnected()) {
      return await remoteDataSource.fetchAddressList();
    } else {
      throw InternetFailure();
    }
  }

  @override
  Future<List<Contact>> fetchAllCandidatesContacts() async {
    if (await networkInfo.isConnected()) {
      return await remoteDataSource.fetchContactList();
    } else {
      throw InternetFailure();
    }
  }
}
