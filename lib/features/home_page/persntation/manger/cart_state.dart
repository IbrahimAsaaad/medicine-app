part of 'cart_cubit.dart';

class CartState {
  final List<ItemMedicine> cartItems;
  final bool loading;

  CartState({
    this.cartItems = const [],
    this.loading= false,
  });

  CartState copyWith({
    List<ItemMedicine>? items,
  }) =>
      CartState(
        cartItems: items ?? cartItems,
        loading: loading,
      );
}
