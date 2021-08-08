import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/widgets/profile_avatar.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(),
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
            ],
          ),
        ),
      ],
    );
  }
}
