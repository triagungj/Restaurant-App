import 'package:get_it/get_it.dart';
import 'package:restaurant_app/core/network/http_client.dart';
import 'package:restaurant_app/core/utils/services/shared_prefs.dart';
import 'package:restaurant_app/data/auth/datasources/auth_local_data_source.dart';
import 'package:restaurant_app/data/auth/datasources/auth_remote_data_source.dart';
import 'package:restaurant_app/data/auth/repositories/repository_impl.dart';
import 'package:restaurant_app/domain/auth/repositories/repository.dart';
import 'package:restaurant_app/domain/auth/usecases/usecase.dart';
import 'package:restaurant_app/env/env_config.dart';
import 'package:restaurant_app/presentation/auth/blocs/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final config = EnvConfig.getInstance();
  final prefs = await SharedPrefs.getInstance();

  sl.registerLazySingleton(() => prefs);

  sl.registerLazySingleton(() => config);

  sl.registerFactory(() => AuthBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));

  // Network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerLazySingleton(() => HttpClient(config: sl(), preferences: sl()));
}
