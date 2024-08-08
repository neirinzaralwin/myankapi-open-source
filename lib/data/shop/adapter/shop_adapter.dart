import 'package:equatable/equatable.dart';
import 'package:myankapi/data/product/adapter/product_adapter.dart';
import 'package:myankapi/data/shop/entity/get_all_shop_entity.dart';
import 'package:myankapi/data/shop/model/get_all_shops.dart';

class ShopAdapter extends Equatable {
  final ShopData model;

  const ShopAdapter(this.model);

  ShopEntity toEntity() => ShopEntity(
      id: model.id ?? "",
      image: model.image ?? "",
      category: ShopCategoryEntity(
          id: model.category?.id ?? "", name: model.category?.name ?? ""),
      name: model.name ?? "",
      ownerName: model.ownerName ?? "",
      products:
          model.products?.map((e) => ProductAdapter(e).toEntity()).toList() ??
              [],
      createdAt: model.createdAt.toString(),
      updatedAt: model.updatedAt.toString());

  @override
  List<Object?> get props => [model];
}
