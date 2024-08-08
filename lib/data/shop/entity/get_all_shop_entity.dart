import 'package:equatable/equatable.dart';
import 'package:myankapi/data/product/entity/product_entity.dart';

class GetAllShopEntity extends Equatable {
  final String message;
  final int totalItems;
  final List<ShopEntity> data;

  const GetAllShopEntity({
    required this.message,
    required this.totalItems,
    required this.data,
  });

  @override
  List<Object> get props => [message, totalItems, data];
}

class ShopCategoryEntity extends Equatable {
  final String id;
  final String name;

  const ShopCategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}

class ShopEntity extends Equatable {
  final String id;
  final String image;
  final ShopCategoryEntity category;
  final String name;
  final String ownerName;
  final List<ProductEntity> products;
  final String createdAt;
  final String updatedAt;

  const ShopEntity({
    required this.id,
    required this.image,
    required this.category,
    required this.name,
    required this.ownerName,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props =>
      [id, image, category, name, ownerName, products, createdAt, updatedAt];
}
