import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/home/data/model/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getHome();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer api;

  HomeRemoteDataSourceImpl({required this.api});

  @override
  Future<List<ProductModel>> getHome() async {
    final response = await api.get(EndPoints.home);
    final List<dynamic> productsData = response['data'];
    return productsData.map((e) => ProductModel.fromJson(e)).toList();
  }
}
