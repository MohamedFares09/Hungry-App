import 'package:dio/dio.dart';
import 'package:hungry_app/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  final CacheHelper cacheHelper;

  ApiInterceptor({required this.cacheHelper});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get token from cache
    final token = cacheHelper.getToken();

    // Add token to headers if it exists
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    }

    super.onRequest(options, handler);
  }
}
