import 'package:json_annotation/json_annotation.dart';
import 'package:myankapi/data/product/model/product.dart';
part 'get_all_shops.g.dart';

@JsonSerializable()
class GetShops {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "total_items")
  final int? totalItems;
  @JsonKey(name: "data")
  final List<ShopData>? data;

  GetShops({
    this.message,
    this.totalItems,
    this.data,
  });

  factory GetShops.fromJson(Map<String, dynamic> json) =>
      _$GetShopsFromJson(json);

  Map<String, dynamic> toJson() => _$GetShopsToJson(this);
}

@JsonSerializable()
class ShopData {
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "category")
  final ShopCategory? category;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "owner_name")
  final String? ownerName;
  @JsonKey(name: "products")
  final List<Product>? products;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "id")
  final String? id;

  ShopData({
    this.image,
    this.category,
    this.name,
    this.ownerName,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShopDataToJson(this);
}

@JsonSerializable()
class ShopCategory {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;

  ShopCategory({
    this.id,
    this.name,
  });

  factory ShopCategory.fromJson(Map<String, dynamic> json) =>
      _$ShopCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ShopCategoryToJson(this);
}
