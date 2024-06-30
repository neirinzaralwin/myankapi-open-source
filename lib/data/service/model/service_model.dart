import 'package:json_annotation/json_annotation.dart';
part 'service_model.g.dart';

@JsonSerializable()
class GetServices {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<Service>? data;

  GetServices({
    this.message,
    this.data,
  });

  factory GetServices.fromJson(Map<String, dynamic> json) =>
      _$GetServicesFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesToJson(this);
}

@JsonSerializable()
class Service {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "price")
  final num? price;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "duration")
  final String? duration;
  @JsonKey(name: "visa_duration")
  final String? visaDuration;
  @JsonKey(name: "imageUrl")
  final String? imageUrl;
  @JsonKey(name: "show_in_home")
  final bool? showInHome;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  Service({
    this.id,
    this.name,
    this.description,
    this.price,
    this.currency,
    this.duration,
    this.visaDuration,
    this.imageUrl,
    this.showInHome,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
