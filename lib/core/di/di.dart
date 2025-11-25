import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/dio_consumer.dart';
import 'package:hungry_app/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:hungry_app/feature/home/data/repos/home_reposotory_impl.dart';
import 'package:hungry_app/feature/home/doman/repo/product_repo.dart';
import 'package:hungry_app/feature/home/doman/usecases/home_usecases.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core - Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Core - API Consumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));

  // Home Feature - Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  // Home Feature - Repositories
  getIt.registerLazySingleton<HomeRepo>(
    () =>
        HomeReposotoryImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  // Home Feature - Use Cases
  getIt.registerLazySingleton<HomeUsecases>(
    () => HomeUsecases(homeRepo: getIt<HomeRepo>()),
  );

  // Home Feature - Cubit (Factory - new instance each time)
  getIt.registerFactory<ProductCubit>(
    () => ProductCubit(getIt<HomeUsecases>()),
  );
}
