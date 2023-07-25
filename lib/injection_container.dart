import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:surf_practice_magic_ball/core/network/network_info.dart';

import 'features/get_fate/data/datasources/magic_ball_fate.dart';
import 'features/get_fate/data/repositories/magic_ball_fate.dart';
import 'features/get_fate/domain/repositories/magic_ball_fate_repository.dart';
import 'features/get_fate/domain/usecases/get_magic_ball_fate.dart';
import 'features/get_fate/presentation/bloc/fate_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => FateBloc(
      fate: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetMagicBallFate(sl()));

  // Repository
  sl.registerLazySingleton<MagicBallFateRepository>(
    () => MagicBallFateRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MagicBallFateDataSource>(
    () => MagicBallFateDataSourceImpl(client: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
