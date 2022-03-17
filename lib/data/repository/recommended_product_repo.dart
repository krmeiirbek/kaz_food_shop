import 'package:get/get.dart';
import 'package:kaz_food_shop/data/api/api_client.dart';
import 'package:kaz_food_shop/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductUri);
  }
}
