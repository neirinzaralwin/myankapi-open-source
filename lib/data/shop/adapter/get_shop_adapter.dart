import 'package:equatable/equatable.dart';
import 'package:myankapi/data/shop/adapter/shop_adapter.dart';
import 'package:myankapi/data/shop/entity/get_all_shop_entity.dart';
import 'package:myankapi/data/shop/model/get_all_shops.dart';

class GetShopAdapter extends Equatable {
  final GetShops model;
  const GetShopAdapter(this.model);

  GetAllShopEntity toEntity() => GetAllShopEntity(
      message: model.message ?? "",
      totalItems: model.totalItems ?? 0,
      data: model.data!.map((e) => ShopAdapter(e).toEntity()).toList());

  @override
  List<Object?> get props => [model];
}
