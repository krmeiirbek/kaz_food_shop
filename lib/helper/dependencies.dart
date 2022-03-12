import 'package:get/get.dart';
import 'package:kaz_food_shop/controllers/cart_controller.dart';
import 'package:kaz_food_shop/controllers/popular_product_controller.dart';
import 'package:kaz_food_shop/controllers/recommended_product_controller.dart';
import 'package:kaz_food_shop/data/api/api_client.dart';
import 'package:kaz_food_shop/data/repository/cart_repo.dart';
import 'package:kaz_food_shop/data/repository/popular_product_repo.dart';
import 'package:kaz_food_shop/data/repository/recommended_product_repo.dart';
import 'package:kaz_food_shop/utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());
  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
