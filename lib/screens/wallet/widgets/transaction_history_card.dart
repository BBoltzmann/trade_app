import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/widgets/profile_avatar.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        bottom: SizeConfig.height(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SimpleText(
                      'Debited',
                      color: AppColors.appBlack,
                    ),
                    UIHelper.horizontalSpaceSmall,
                    SimpleText(
                      '11:42',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    Spacer(),
                    //:todo short outlined button goes here
                  ],
                ),
                UIHelper.customVerticalSpace(4.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SimpleText(
                      'You made a transaction of \$500 to Debbie T.',
                      color: AppColors.appBlack,
                      size: 12,
                    ),
                    Spacer(),
                    SimpleText(
                      '-\$500',
                      size: 12,
                      color: AppColors.error200,
                    ),
                  ],
                ),
                UIHelper.customVerticalSpace(2.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SimpleText(
                      'Thursday, July 22',
                      color: AppColors.grey1,
                      size: 12,
                    ),
                    Spacer(),
                    SimpleText(
                      'Done',
                      size: 12,
                      color: AppColors.appBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
