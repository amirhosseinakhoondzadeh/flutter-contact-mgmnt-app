import 'package:a_job_thing_test/core/network_info/network_info.dart';
import 'package:meta/meta.dart';

import 'network_layer/remote_datasource.dart';

abstract class DataSource {}

class DataSourceImpl implements DataSource {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DataSourceImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });
}
