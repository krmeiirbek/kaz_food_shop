import 'package:flutter/material.dart';
import 'package:kaz_food_shop/utils/colors.dart';
import 'package:kaz_food_shop/widgets/big_text.dart';
import 'package:kaz_food_shop/widgets/icon_and_text_widget.dart';
import 'package:kaz_food_shop/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }
}

Widget _buildPageItem(int position) {
  return Stack(
    children: [
      Container(
        height: 220,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF69c5df),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/food0.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BigText(text: 'Chinese Side'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SmallText(text: "5.0"),
                    const SizedBox(
                      width: 10,
                    ),
                    const SmallText(text: "1287 comments"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconAndTextWidget(
                      icon: Icons.circle_sharp,
                      text: 'Normal',
                      iconColor: AppColors.iconColor1,
                    ),
                    IconAndTextWidget(
                      icon: Icons.location_on,
                      text: '1.7km',
                      iconColor: AppColors.mainColor,
                    ),
                    IconAndTextWidget(
                      icon: Icons.access_time_rounded,
                      text: '32min',
                      iconColor: AppColors.iconColor2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
