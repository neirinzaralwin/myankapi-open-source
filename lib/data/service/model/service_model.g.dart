// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServices _$GetServicesFromJson(Map<String, dynamic> json) => GetServices(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetServicesToJson(GetServices instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      currency: json['currency'] as String?,
      duration: json['duration'] as String?,
      visaDuration: json['visa_duration'] as String?,
      imageUrl: json['imageUrl'] as String?,
      showInHome: json['show_in_home'] as bool?,
      route: json['route'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'duration': instance.duration,
      'visa_duration': instance.visaDuration,
      'imageUrl': instance.imageUrl,
      'show_in_home': instance.showInHome,
      'route': instance.route,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
