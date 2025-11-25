import 'package:flutter/foundation.dart';
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

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['data']['id'] ?? 0,
      price: json['data']['price'] ?? '',
      title: json['data']['title'] ?? '',
      desc: json['data']['desc'] ?? '',
      image: json['data']['image'] ?? '',
      rate: json['data']['rate'] ?? 0,
    );
  }
}
