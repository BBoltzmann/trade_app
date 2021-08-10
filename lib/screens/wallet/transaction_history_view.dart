import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/widgets/transaction_history_card.dart';
import 'package:trade_app/screens/wallet/widgets/wallet_card.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/sizable_scaffold.dart';
import 'package:trade_app/widgets/size_config.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeableScaffold(
        body: Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.width(10),
        right: SizeConfig.width(10),
        top: SizeConfig.height(55),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.appBlack,
                ),
              ),
              SimpleText(
                'Transaction History',
                size: 18,
                color: AppColors.appBlack,
                weight: FontWeight.w700,
              ),
            ],
          ),
          UIHelper.customVerticalSpace(10.0),
          WalletCard(),
          UIHelper.customVerticalSpace(44.0),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleText(
                  'Recent transactions',
                  weight: FontWeight.w600,
                  size: 16,
                  color: AppColors.appBlack,
                ),
                SimpleText(
                  'View all',
                  weight: FontWeight.w600,
                  size: 16,
                  color: AppColors.primaryMain50,
                ),
              ],
            ),
          ),
          UIHelper.customVerticalSpace(23.0),
          TransactionHistoryCard(),
          TransactionHistoryCard(),
          TransactionHistoryCard(),
        ],
      ),
    ));
  }
}
