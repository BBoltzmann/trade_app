import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/widgets/profile_avatar.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_currency_price.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'wallet-card',
      child: Container(
        height: SizeConfig.height(180),
        width: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/wallet-card-bg.png'),
          //   fit: BoxFit.fill,
          // ),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryMain50,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, SizeConfig.height(8)),
              blurRadius: 20,
              color: AppColors.primaryMain50.withOpacity(0.4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: SizeConfig.width(5.6),
              top: SizeConfig.height(41),
              child: Image(
                image: AssetImage('assets/images/feather_link.png'),
                width: SizeConfig.width(140),
              ),
            ),
            Positioned(
              right: SizeConfig.width(5.6),
              top: SizeConfig.height(41),
              child: Image(
                image: AssetImage('assets/images/feather_link.png'),
                width: SizeConfig.width(140),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.width(17),
                top: SizeConfig.height(19),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProfileAvatar(),
                      UIHelper.horizontalSpaceSmall,
                      SimpleText(
                        'Welcome, Mark',
                        color: AppColors.appWhite,
                        weight: FontWeight.w700,
                        size: 16,
                      ),
                    ],
                  ),
                  UIHelper.verticalSpaceMedium,
                  SimpleText(
                    'Balance',
                    color: AppColors.appWhite,
                    weight: FontWeight.w400,
                  ),
                  UIHelper.customVerticalSpace(4.0),
                  SimpleText(
                    '\$ 150,000',
                    color: AppColors.appWhite,
                    weight: FontWeight.w700,
                    size: 16,
                  ),
                  UIHelper.customVerticalSpace(4.0),
                  AppCurrencyWithLabel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
