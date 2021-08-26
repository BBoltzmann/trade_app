import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/transaction_history_view.dart';
import 'package:trade_app/screens/wallet/widgets/wallet_card.dart';
import 'package:trade_app/screens/wallet/widgets/wallet_menu_button.dart';
import 'package:trade_app/screens/wallet/withdrawal_view.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/sizable_scaffold.dart';
import 'package:trade_app/widgets/size_config.dart';

import 'deposit_view.dart';

class WalletPageView extends StatelessWidget {
  const WalletPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizeableScaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.width(10),
          right: SizeConfig.width(10),
          top: SizeConfig.height(55),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.width(26)),
              child: SimpleText(
                'Wallet',
                size: 18,
                color: AppColors.appBlack,
                weight: FontWeight.w700,
              ),
            ),
            UIHelper.customVerticalSpace(20.0),
            WalletCard(),
            UIHelper.customVerticalSpace(44.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: WalletMenuButton(
                          icon: ImageIcon(
                            AssetImage('assets/icons/wallet-icon.png'),
                            color: AppColors.grey1,
                          ),
                          label: 'Deposit',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DepositView(),
                                ));
                          },
                        ),
                      ),
                      UIHelper.customHorizontalSpace(35),
                      Expanded(
                        child: WalletMenuButton(
                          icon: ImageIcon(
                            AssetImage('assets/icons/settings-icon.png'),
                            color: AppColors.grey1,
                          ),
                          label: 'settings',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  UIHelper.customVerticalSpace(40.0),
                  Row(
                    children: [
                      Expanded(
                        child: WalletMenuButton(
                          icon: ImageIcon(
                            AssetImage('assets/icons/transfer-icon.png'),
                            color: AppColors.grey1,
                          ),
                          label: 'Withdrawal',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithdrawalView(),
                                ));
                          },
                        ),
                      ),
                      UIHelper.customHorizontalSpace(35),
                      Expanded(
                        child: WalletMenuButton(
                          icon: ImageIcon(
                            AssetImage('assets/icons/history-icon.png'),
                            color: AppColors.grey1,
                          ),
                          label: 'History',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TransactionHistoryView(),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
