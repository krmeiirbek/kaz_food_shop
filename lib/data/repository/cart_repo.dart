import 'dart:convert';

import 'package:kaz_food_shop/models/cart_model.dart';
import 'package:kaz_food_shop/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];
    for (var element in cartList) {
      element.time = time;
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstants.storePreference, cart);
  }

  List<CartModel> getCartList() {
    List<CartModel> cartList = [];
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.storePreference)) {
      carts = sharedPreferences.getStringList(AppConstants.storePreference)!;
    }

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.cartHistoryList)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
    }
    List<CartModel> cartListHistory = [];
    for (var element in cartHistory) {
      cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    }
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if(sharedPreferences.containsKey(AppConstants.cartHistoryList)){
      cartHistory = sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.cartHistoryList, cartHistory);
  }

  void removeCart() {
    cart.clear();
    sharedPreferences.remove(AppConstants.storePreference);
  }
}
