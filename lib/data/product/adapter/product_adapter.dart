import 'package:equatable/equatable.dart';
import 'package:myankapi/data/product/entity/product_entity.dart';
import 'package:myankapi/data/product/model/product.dart';

class ProductAdapter extends Equatable {
  final Product model;

  const ProductAdapter(this.model);

  ProductEntity toEntity() => ProductEntity(
      id: model.id ?? "",
      photos: model.photos ?? [],
      name: model.name ?? "",
      price: model.price ?? 0.0,
      stock: model.stock ?? 0,
      isActive: model.isActive ?? false,
      createdAt: model.createdAt ?? "",
      updatedAt: model.updatedAt ?? "");

  @override
  List<Object?> get props => [model];
}
