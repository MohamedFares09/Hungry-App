import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/cache/cache_helper.dart';
import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/api_interceptor.dart';
import 'package:hungry_app/core/networking/api/dio_consumer.dart';
import 'package:hungry_app/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:hungry_app/feature/home/data/repos/home_reposotory_impl.dart';
import 'package:hungry_app/feature/home/doman/repo/product_repo.dart';
import 'package:hungry_app/feature/home/doman/usecases/home_usecases.dart';
import 'package:hungry_app/feature/home/doman/usecases/product_with_id_use_cases.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_cubit.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_cubit.dart';
import 'package:hungry_app/feature/profile/data/datasources/profile_remote_data_source.dart';
import 'package:hungry_app/feature/profile/data/repos/profile_repository_impl.dart';
import 'package:hungry_app/feature/profile/domain/repo/profile_repo.dart';
import 'package:hungry_app/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core - SharedPreferences (must be async)
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Core - CacheHelper
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(sharedPreferences: getIt<SharedPreferences>()),
  );

  // Core - Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Core - API Interceptor
  getIt.registerLazySingleton<ApiInterceptor>(
    () => ApiInterceptor(cacheHelper: getIt<CacheHelper>()),
  );

  // Core - API Consumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(getIt<Dio>(), apiInterceptor: getIt<ApiInterceptor>()),
  );

  // Home Feature - Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  // Home Feature - Repositories
  getIt.registerLazySingleton<ProductRepo>(
    () =>
        HomeReposotoryImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  // Home Feature - Use Cases
  getIt.registerLazySingleton<HomeUsecases>(
    () => HomeUsecases(productRepo: getIt<ProductRepo>()),
  );

  getIt.registerLazySingleton<ProductWithIdUseCases>(
    () => ProductWithIdUseCases(productRepo: getIt<ProductRepo>()),
  );

  // Home Feature - Cubit (Factory - new instance each time)
  getIt.registerFactory<ProductCubit>(
    () => ProductCubit(getIt<HomeUsecases>()),
  );

  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(
      getIt<ProductWithIdUseCases>(),
      getIt<HomeRemoteDataSource>(),
    ),
  );

  // Profile Feature - Data Sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  // Profile Feature - Repositories
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );

  // Profile Feature - Use Cases
  getIt.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCase(profileRepo: getIt<ProfileRepo>()),
  );

  getIt.registerLazySingleton<UpdateUserProfileUseCase>(
    () => UpdateUserProfileUseCase(profileRepo: getIt<ProfileRepo>()),
  );

  // Profile Feature - Cubit (Factory - new instance each time)
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      getIt<GetUserProfileUseCase>(),
      getIt<UpdateUserProfileUseCase>(),
    ),
  );
}
