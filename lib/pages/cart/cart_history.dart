import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaz_food_shop/controllers/cart_controller.dart';
import 'package:kaz_food_shop/utils/app_constants.dart';
import 'package:kaz_food_shop/utils/colors.dart';
import 'package:kaz_food_shop/utils/dimensions.dart';
import 'package:kaz_food_shop/widgets/app_icon.dart';
import 'package:kaz_food_shop/widgets/big_text.dart';
import 'package:kaz_food_shop/widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = {};
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    int listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            height: Dimensions.height20 * 5,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BigText(
                  text: 'Cart History',
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.height20,
                right: Dimensions.height20,
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height30 * 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateTime parseDate =
                                  DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                                      getCartHistoryList[listCounter].time!);
                              var outputFormat =
                                  DateFormat('dd/MM/yyyy hh:mm a');
                              var outputDate = outputFormat.format(parseDate);
                              return BigText(text: outputDate);
                            }()),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: Dimensions.height20 * 4,
                                            width: Dimensions.width20 * 4,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    AppConstants.uploadsUrl +
                                                        getCartHistoryList[
                                                                listCounter - 1]
                                                            .img!),
                                              ),
                                            ),
                                          )
                                        : const SizedBox();
                                  }),
                                ),
                                SizedBox(
                                  height: Dimensions.height20 * 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SmallText(
                                        text: 'Total',
                                        color: AppColors.titleColor,
                                      ),
                                      BigText(
                                        text: '${itemsPerOrder[i]} Items',
                                        color: AppColors.titleColor,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width10,
                                          vertical: Dimensions.height5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15 / 2),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.mainColor),
                                        ),
                                        child: const SmallText(
                                          text: 'one more',
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
