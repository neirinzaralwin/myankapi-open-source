import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final List<String>? photos;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "stock")
  final int? stock;
  @JsonKey(name: "is_active")
  final bool? isActive;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "id")
  final String? id;

  Product({
    this.name,
    this.photos,
    this.price,
    this.stock,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
