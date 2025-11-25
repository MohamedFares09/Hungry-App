import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/api/end_points.dart';
import 'package:hungry_app/feature/home/data/model/product_model.dart';
import 'package:hungry_app/feature/home/data/model/topping_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getHome();
  Future<ProductModel> getProductWithId(int id);
  Future<List<ToppingModel>> getToppings();
  Future<List<ToppingModel>> getSideOptions();
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

  @override
  Future<ProductModel> getProductWithId(int id) async {
    final response = await api.get('${EndPoints.home}/$id');
    final productData = response['data'];
    return ProductModel.fromJson(productData);
  }

  @override
  Future<List<ToppingModel>> getToppings() async {
    final response = await api.get(EndPoints.toppings);
    final List<dynamic> toppingsData = response['data'];
    return toppingsData.map((e) => ToppingModel.fromJson(e)).toList();
  }

  @override
  Future<List<ToppingModel>> getSideOptions() async {
    final response = await api.get(EndPoints.sideOptions);
    final List<dynamic> sideOptionsData = response['data'];
    return sideOptionsData.map((e) => ToppingModel.fromJson(e)).toList();
  }
}
