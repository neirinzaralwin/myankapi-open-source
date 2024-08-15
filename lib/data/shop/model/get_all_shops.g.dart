// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_shops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetShops _$GetShopsFromJson(Map<String, dynamic> json) => GetShops(
      message: json['message'] as String?,
      totalItems: (json['total_items'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShopData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetShopsToJson(GetShops instance) => <String, dynamic>{
      'message': instance.message,
      'total_items': instance.totalItems,
      'data': instance.data,
    };

ShopData _$ShopDataFromJson(Map<String, dynamic> json) => ShopData(
      image: json['image'] as String?,
      category: json['category'] == null
          ? null
          : ShopCategory.fromJson(json['category'] as Map<String, dynamic>),
      name: json['name'] as String?,
      ownerName: json['owner_name'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShopDataToJson(ShopData instance) => <String, dynamic>{
      'image': instance.image,
      'category': instance.category,
      'name': instance.name,
      'owner_name': instance.ownerName,
      'products': instance.products,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
    };

ShopCategory _$ShopCategoryFromJson(Map<String, dynamic> json) => ShopCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ShopCategoryToJson(ShopCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
