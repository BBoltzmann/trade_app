import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/constants.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

class MarketItemCard extends StatelessWidget {
  const MarketItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appPadding(left: 20, right: 20, top: 30, bottom: 27),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: SizeConfig.height(18),
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleText(
                      'Celine Jones',
                      size: 18,
                      weight: FontWeight.w700,
                      color: AppColors.appBlack,
                    ),
                    UIHelper.customVerticalSpace(4.0),
                    SimpleText(
                      'Nicosia, Cyprus',
                      color: AppColors.appBlack,
                      weight: FontWeight.w400,
                    ),
                    UIHelper.customVerticalSpace(4.0),
                    SimpleText(
                      '20 minutes ago',
                      size: 8,
                      color: AppColors.appBlack,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              ImageIcon(
                optionsIcon,
                color: AppColors.appBlackVariant2,
              ),
            ],
          ),
          UIHelper.customVerticalSpace(4),
          Stack(
            children: [
              Image(image: AssetImage('assets/images/test_market_image.png')),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  height: SizeConfig.height(48),
                  width: SizeConfig.height(48),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundGrey.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: ImageIcon(
                      tagIcon,
                      color: AppColors.appBlack,
                      size: SizeConfig.width(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          UIHelper.customVerticalSpace(4),
          FlyerCaption(),
          UIHelper.customVerticalSpace(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FlyerAction(
                        icon: ImageIcon(
                          heartIcon,
                          color: AppColors.error200,
                        ),
                      ),
                      UIHelper.customHorizontalSpace(27),
                      FlyerAction(
                        icon: Image(
                          image: messageIcon,
                          width: SizeConfig.width(18),
                        ),
                      ),
                    ],
                  ),
                  UIHelper.customHorizontalSpace(5),
                  SimpleText(
                    'View comments',
                    weight: FontWeight.w700,
                    size: 8,
                  ),
                ],
              ),
              Container(
                height: SizeConfig.height(34),
                width: SizeConfig.width(68),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.appWhite,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      color: AppColors.appBlack.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Center(
                  child: ImageIcon(
                    chatBoxIcon,
                    color: AppColors.primaryMain50,
                    size: SizeConfig.width(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FlyerCaption extends StatelessWidget {
  const FlyerCaption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleText(
          'Deal: ',
          weight: FontWeight.w700,
          size: 14,
          color: AppColors.appBlack,
        ),
        //:todo add view more functionality
        SimpleText(
          'Fresh nutritious strawberries....',
          weight: FontWeight.w400,
          size: 12,
          color: AppColors.appBlack,
        ),
      ],
    );
  }
}

class FlyerAction extends StatelessWidget {
  const FlyerAction({Key? key, required this.icon}) : super(key: key);
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        UIHelper.horizontalSpaceSmall,
        SimpleText(
          '213',
          color: AppColors.appBlack,
          size: 12,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
