import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final num price;
  final num stock;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props =>
      [id, name, price, stock, isActive, createdAt, updatedAt];
}
