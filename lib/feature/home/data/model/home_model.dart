import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  final int id;
  final String price;
  HomeModel({
    required super.title,
    required super.desc,
    required super.image,
    required super.rate,
    required this.id,
    required this.price,
  });
}
