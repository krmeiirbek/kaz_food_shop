import 'package:flutter/material.dart';
import 'package:kaz_food_shop/utils/colors.dart';
import 'package:kaz_food_shop/utils/dimensions.dart';
import 'package:kaz_food_shop/widgets/app_column.dart';
import 'package:kaz_food_shop/widgets/app_icon.dart';
import 'package:kaz_food_shop/widgets/big_text.dart';
import 'package:kaz_food_shop/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/food0.png')),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(
                    text: 'Chinese Side',
                  ),
                  SizedBox(height: Dimensions.height20),
                  const BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text:
                            'KAzybek Meiirbek djnjdas asdkj askdk fasjasf afdjkaffakfd dkdfs dfdfkdf dfsdgsgd dfd  fdmdffd dfmdfkass fdf fdskdf dfjkdfjsdf dfkdf dffdkfds dfkdf dfkdf f fd.KAzybek Meiirbek djnjdas asdkj askdk fasjasf afdjkaffakfd dkdfs dfdfkdf dfsdgsgd dfd  fdmdffd dfmdfkass fdf fdskdf dfjkdfjsdf dfkdf dffdkfds dfkdf dfkdf f fd.KAzybek Meiirbek djnjdas asdkj askdk fasjasf afdjkaffakfd dkdfs dfdfkdf dfsdgsgd dfd  fdmdffd dfmdfkass fdf fdskdf dfjkdfjsdf dfkdf dffdkfds dfkdf dfkdf f fd.KAzybek Meiirbek djnjdas asdkj askdk fasjasf afdjkaffakfd dkdfs dfdfkdf dfsdgsgd dfd  fdmdffd dfmdfkass fdf fdskdf dfjkdfjsdf dfkdf dffdkfds dfkdf dfkdf f fd.KAzybek Meiirbek djnjdas asdkj askdk fasjasf afdjkaffakfd dkdfs dfdfkdf dfsdgsgd dfd  fdmdffd dfmdfkass fdf fdskdf dfjkdfjsdf dfkdf dffdkfds dfkdf dfkdf f fd.KAzybek Meiirbek djnjdas asdkj askdk fasjasf afdjkaffakfd dkdfs dfdfkdf dfsdgsgd dfd  fdmdffd dfmdfkass fdf fdskdf dfjkdfjsdf dfkdf dffdkfds dfkdf dfkdf f fd.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height30 * 4,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width5),
                  const BigText(text: '0'),
                  SizedBox(width: Dimensions.width5),
                  const Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
              child: const BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
