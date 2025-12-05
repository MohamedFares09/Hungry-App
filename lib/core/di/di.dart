import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/cache/cache_helper.dart';
import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/api_interceptor.dart';
import 'package:hungry_app/core/networking/api/dio_consumer.dart';
import 'package:hungry_app/feature/auth/login/data/datasources/auth_remote_data_source.dart';
import 'package:hungry_app/feature/auth/login/data/repos/auth_repository_impl.dart';
import 'package:hungry_app/feature/auth/login/domain/repo/user_repo.dart';
import 'package:hungry_app/feature/auth/login/domain/usecases/logout_usecase.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/logout_cubit.dart';
import 'package:hungry_app/feature/cart/data/datasources/cart_remote_data_source.dart';
import 'package:hungry_app/feature/cart/data/repos/cart_repository_impl.dart';
import 'package:hungry_app/feature/cart/domain/repos/cart_repo.dart';
import 'package:hungry_app/feature/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:hungry_app/feature/cart/domain/usecases/get_cart_usecase.dart';
import 'package:hungry_app/feature/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_cubit.dart';
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
import 'package:hungry_app/feature/order_history/data/datasources/order_remote_data_source.dart';
import 'package:hungry_app/feature/order_history/data/repos/order_repository_impl.dart';
import 'package:hungry_app/feature/order_history/domain/repos/order_repo.dart';
import 'package:hungry_app/feature/order_history/domain/usecases/create_order_usecase.dart';
import 'package:hungry_app/feature/order_history/domain/usecases/get_orders_usecase.dart';
import 'package:hungry_app/feature/order_history/presentation/cubit/order_cubit.dart';
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

  // Cart Feature - Data Sources
  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  // Cart Feature - Repositories
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepositoryImpl(remoteDataSource: getIt<CartRemoteDataSource>()),
  );

  // Cart Feature - Use Cases
  getIt.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(cartRepo: getIt<CartRepo>()),
  );
  getIt.registerLazySingleton<GetCartUseCase>(
    () => GetCartUseCase(cartRepo: getIt<CartRepo>()),
  );
  getIt.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(cartRepo: getIt<CartRepo>()),
  );

  // Cart Feature - Cubit (Factory - new instance each time)
  getIt.registerFactory<CartCubit>(
    () => CartCubit(
      addToCartUseCase: getIt<AddToCartUseCase>(),
      getCartUseCase: getIt<GetCartUseCase>(),
      removeFromCartUseCase: getIt<RemoveFromCartUseCase>(),
    ),
  );

  // Order Feature - Data Sources
  getIt.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  // Order Feature - Repositories
  getIt.registerLazySingleton<OrderRepo>(
    () => OrderRepositoryImpl(remoteDataSource: getIt<OrderRemoteDataSource>()),
  );

  // Order Feature - Use Cases
  getIt.registerLazySingleton<CreateOrderUseCase>(
    () => CreateOrderUseCase(orderRepo: getIt<OrderRepo>()),
  );
  getIt.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(orderRepo: getIt<OrderRepo>()),
  );

  // Order Feature - Cubit
  getIt.registerFactory<OrderCubit>(
    () => OrderCubit(
      createOrderUseCase: getIt<CreateOrderUseCase>(),
      getOrdersUseCase: getIt<GetOrdersUseCase>(),
    ),
  );

  // Auth Feature - Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  // Auth Feature - Repositories
  getIt.registerLazySingleton<UserRepo>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      cacheHelper: getIt<CacheHelper>(),
    ),
  );

  // Auth Feature - Use Cases
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(userRepo: getIt<UserRepo>()),
  );

  // Auth Feature - Cubit (Factory - new instance each time)
  getIt.registerFactory<LogoutCubit>(
    () => LogoutCubit(logoutUseCase: getIt<LogoutUseCase>()),
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
      cacheHelper: getIt<CacheHelper>(),
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
