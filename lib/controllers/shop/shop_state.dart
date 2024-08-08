part of 'shop_cubit.dart';

sealed class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

final class ShopInitial extends ShopState {}

final class ShopLoading extends ShopState {}

final class ShopSuccess extends ShopState {
  final List<ShopEntity> shops;
  const ShopSuccess({required this.shops});
  @override
  List<Object> get props => [shops];
}

final class ShopFailure extends ShopState {
  final String message;
  const ShopFailure(this.message);
  @override
  List<Object> get props => [message];
}
