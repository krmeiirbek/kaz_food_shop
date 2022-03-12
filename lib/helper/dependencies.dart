import 'package:get/get.dart';
import 'package:kaz_food_shop/controllers/popular_product_controller.dart';
import 'package:kaz_food_shop/data/api/api_client.dart';
import 'package:kaz_food_shop/data/repository/popular_product_repo.dart';
import 'package:kaz_food_shop/utils/app_constants.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}