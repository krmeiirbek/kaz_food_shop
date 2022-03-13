import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaz_food_shop/controllers/cart_controller.dart';
import 'package:kaz_food_shop/data/repository/popular_product_repo.dart';
import 'package:kaz_food_shop/models/products_model.dart';
import 'package:kaz_food_shop/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  late CartController _cart;
  bool _isLoaded = false;
  int _inCartItems = 0;
  int _quantity = 0;

  List<dynamic> get popularProductList => _popularProductList;

  bool get isLoaded => _isLoaded;

  int get quantity => _quantity;

  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    final response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar(
        'Item count',
        "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar(
        'Item count',
        "You can't add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
  }
}
