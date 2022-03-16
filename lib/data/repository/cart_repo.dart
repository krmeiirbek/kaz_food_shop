import 'dart:convert';

import 'package:kaz_food_shop/models/cart_model.dart';
import 'package:kaz_food_shop/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    for (var element in cartList) {
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstants.STORE_PREFERENCE, cart);
  }

  List<CartModel> getCartList() {
    List<CartModel> cartList = [];
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.STORE_PREFERENCE)) {
      carts = sharedPreferences.getStringList(AppConstants.STORE_PREFERENCE)!;
    }

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartList;
  }
}
