import 'package:a_job_thing_test/blocs/bloc.dart';
import 'package:a_job_thing_test/data/data_source.dart';
import 'package:a_job_thing_test/data/network_layer/remote_datasource.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;

import 'core/network_info/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory<CandidatesBloc>(
    () => CandidatesBloc(
      dataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<DataSource>(
    () => DataSourceImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Core & External Libraries
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
