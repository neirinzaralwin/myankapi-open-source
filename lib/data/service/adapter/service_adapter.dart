import 'package:myankapi/data/service/entity/service_entity.dart';
import 'package:myankapi/data/service/model/service_model.dart';

class GetServicesAdapter {
  final GetServices model;

  GetServicesAdapter(this.model);

  GetServicesEntity toEntity() {
    return GetServicesEntity(
      message: model.message ?? "",
      data: model.data?.map((e) => ServiceAdapter(e).toEntity()).toList() ?? [],
    );
  }
}

class ServiceAdapter {
  final Service model;

  ServiceAdapter(this.model);

  ServiceEntity toEntity() {
    return ServiceEntity(
      id: model.id ?? "",
      name: model.name ?? "",
      description: model.description ?? "",
      price: model.price ?? 0.0,
      duration: model.duration ?? "",
      visaDuration: model.visaDuration ?? "",
      imageUrl: model.imageUrl ?? "",
      showInHome: model.showInHome ?? false,
      route: model.route ?? "",
      createdAt: model.createdAt?.toString() ?? "",
      updatedAt: model.updatedAt?.toString() ?? "",
    );
  }
}
