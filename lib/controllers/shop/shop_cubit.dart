import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myankapi/data/shop/adapter/get_shop_adapter.dart';
import 'package:myankapi/data/shop/entity/get_all_shop_entity.dart';
import 'package:myankapi/data/shop/model/get_all_shops.dart';
import 'package:myankapi/repositories/api_singleton.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  Future<void> getAllShops() async {
    emit(ShopLoading());
    try {
      final response = await ApiSingleton.shop.getShops();
      final model = GetShops.fromJson(response);
      final entity = GetShopAdapter(model).toEntity();
      final List<ShopEntity> shops = entity.data;
      emit(ShopSuccess(shops: shops));
    } catch (e) {
      debugPrint(e.toString());
      if (e is DioException) {
        emit(ShopFailure(e.message ?? "Something went wrong"));
      } else {
        emit(const ShopFailure('Something went wrong in getting shops'));
      }
    }
  }
}
