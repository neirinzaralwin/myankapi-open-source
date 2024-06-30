import 'package:equatable/equatable.dart';

class GetServicesEntity extends Equatable {
  final String message;
  final List<ServiceEntity> data;

  const GetServicesEntity({
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [message, data];
}

class ServiceEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final num price;
  final String duration;
  final String visaDuration;
  final String imageUrl;
  final bool showInHome;
  final String createdAt;
  final String updatedAt;

  const ServiceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.visaDuration,
    required this.imageUrl,
    required this.showInHome,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        duration,
        visaDuration,
        imageUrl,
        showInHome,
        createdAt,
        updatedAt,
      ];
}
