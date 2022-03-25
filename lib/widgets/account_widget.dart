import 'package:flutter/material.dart';
import 'package:kaz_food_shop/utils/dimensions.dart';
import 'package:kaz_food_shop/widgets/app_icon.dart';
import 'package:kaz_food_shop/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key, required this.appIcon, required this.bigText}) : super(key: key);

  final AppIcon appIcon;
  final BigText bigText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: Dimensions.width20,top: Dimensions.height10,bottom: Dimensions.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20),
          bigText,
        ],
      ),
    );
  }
}
