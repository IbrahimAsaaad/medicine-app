
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/features/home_page/data/item_medicine.dart';
part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  bool checkIsAddedToCart(ItemMedicine itemMedicine) =>
      state.cartItems.contains(itemMedicine);

  // add
  void addItem(ItemMedicine itemMedicine) {
    final cartItems = [...state.cartItems];

    final targetIndex = cartItems.indexWhere(
      (element) => element.id == itemMedicine.id,
    );

    if (targetIndex == -1) {
      cartItems.add(itemMedicine);
    } else {
      final newItem = ItemMedicine(
        id: itemMedicine.id,
        title: itemMedicine.title,
        subtitle: itemMedicine.subtitle,
        Abb: itemMedicine.Abb,
        image: itemMedicine.image,
        price: itemMedicine.price,
        quantity: cartItems[targetIndex].quantity + 1,
      );

      cartItems[targetIndex] = newItem;
    }

    emit(state.copyWith(items: cartItems));
  }

  // decrement qty
  void decrementQty(ItemMedicine itemMedicine) {
    if (itemMedicine.quantity == 1) return;

    final cartItems = [...state.cartItems];

    final targetIndex = cartItems.indexWhere(
      (element) => element.id == itemMedicine.id,
    );

    if (targetIndex == -1) return;

    final newItem = ItemMedicine(
      id: itemMedicine.id,
      title: itemMedicine.title,
      subtitle: itemMedicine.subtitle,
      Abb: itemMedicine.Abb,
      image: itemMedicine.image,
      price: itemMedicine.price,
      quantity: cartItems[targetIndex].quantity - 1,
    );

    cartItems[targetIndex] = newItem;

    emit(state.copyWith(items: cartItems));
  }

  // delete
  void deleteItem(ItemMedicine itemMedicine) {
    final cartItems = [...state.cartItems];

    final targetIndex = cartItems.indexWhere(
      (element) => element.id == itemMedicine.id,
    );

    if (targetIndex == -1) return;
    cartItems.removeAt(targetIndex);
    emit(state.copyWith(items: cartItems));
  }

  // delete all
  void deleteAllItems() => emit(state.copyWith(items: []));
}
