import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaz_food_shop/controllers/popular_product_controller.dart';
import 'package:kaz_food_shop/controllers/recommended_product_controller.dart';
import 'package:kaz_food_shop/routes/route_helper.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (_) => GetBuilder<RecommendedProductController>(
        builder: (_) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        ),
      ),
    );
  }
}
