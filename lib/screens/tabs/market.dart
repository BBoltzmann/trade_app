import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/constants.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/market_item_card.dart';
import 'package:trade_app/widgets/size_config.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: appPadding(top: 62),
      child: Column(
        children: [
          Padding(
            padding: appPadding(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                InkWell(
                  splashColor: AppColors.appWhite.withOpacity(0),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Padding(
                    padding: appPadding(left: 10),
                    child: ImageIcon(
                      menuIcon,
                      color: AppColors.appBlack,
                    ),
                  ),
                ),
                UIHelper.customHorizontalSpace(50.0),
                Expanded(
                  child: TextFormFieldWidget(
                    borderColor: AppColors.greyBF,
                    hintText: 'date, hashtags, name, profile',
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: ImageIcon(
                        searchIcon,
                        size: SizeConfig.width(24),
                        color: AppColors.grey1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIHelper.customVerticalSpace(22),
          Padding(
            padding: appPadding(
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleText(
                  'Market',
                  size: 24,
                  color: AppColors.appBlack,
                ),
                Container(
                  height: SizeConfig.width(40),
                  width: SizeConfig.width(40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryMain50,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 6),
                        blurRadius: 20,
                        color: AppColors.appBlack.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: AppColors.appWhite,
                    size: SizeConfig.width(35),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MarketItemCard(),
                  MarketItemCard(),
                  MarketItemCard(),
                  MarketItemCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatIconWidget extends StatelessWidget {
  const StatIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
