import 'package:flutter/material.dart';
import 'package:kaz_food_shop/home/food_page_body.dart';
import 'package:kaz_food_shop/utils/colors.dart';
import 'package:kaz_food_shop/utils/dimensions.dart';
import 'package:kaz_food_shop/widgets/big_text.dart';
import 'package:kaz_food_shop/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const BigText(
                      text: "Kazakhstan",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: const [
                        SmallText(
                          text: "Almaty",
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const FoodPageBody(),
        ],
      ),
    );
  }
}
