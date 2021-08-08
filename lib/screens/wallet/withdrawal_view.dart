import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/widgets/custom_selection_dropdown.dart';
import 'package:trade_app/screens/wallet/widgets/wallet_card.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_currency_price.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/sizable_scaffold.dart';
import 'package:trade_app/widgets/size_config.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class WithdrawalView extends StatefulWidget {
  const WithdrawalView({Key? key}) : super(key: key);

  @override
  _WithdrawalViewState createState() => _WithdrawalViewState();
}

class _WithdrawalViewState extends State<WithdrawalView> {
  String? selectedCurrency;
  String? selectedBank;
  @override
  Widget build(BuildContext context) {
    return SizeableScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.height(51),
            left: SizeConfig.width(10),
            right: SizeConfig.width(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Withdrawal',
                    size: 18,
                    color: AppColors.appBlack,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              UIHelper.verticalSpaceMediumPlus,
              WalletCard(),
              UIHelper.customVerticalSpace(24.0),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(10),
                ),
                child: WithdrawalRestrictionsCard(),
              ),
              UIHelper.customVerticalSpace(16.0),
              CustomSelectionDropdown(
                onCurrencySelected: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              ),
              if (selectedCurrency != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormFieldWidget(
                      readOnly: true,
                      controller: TextEditingController()
                        ..text = selectedCurrency!,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            title: 'Amount (NGN)',
                          ),
                        ),
                        UIHelper.customHorizontalSpace(34.0),
                        //:todo replace with icon from design
                        Icon(
                          Icons.repeat,
                          color: AppColors.primaryMain50,
                        ),
                        UIHelper.customHorizontalSpace(34.0),
                        Expanded(
                          child: TextFormFieldWidget(
                            title: 'Amount (TELE)',
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpaceMedium,
                    CustomSelectionDropdown(
                      label: 'Select Bank',
                      onCurrencySelected: (value) {
                        setState(() {
                          selectedBank = value;
                        });
                      },
                      dropdownList: [
                        'Guaranty Trust Bank',
                        'Guaranty Trust Bank',
                        'Guaranty Trust Bank',
                        'Guaranty Trust Bank',
                        'UBA',
                        'UBA',
                        'UBA',
                      ],
                    ),
                    if (selectedBank != null)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormFieldWidget(
                            readOnly: true,
                            controller: TextEditingController()
                              ..text = selectedBank!,
                          ),
                          UIHelper.verticalSpaceMedium,
                          TextFormFieldWidget(title: 'Account number'),
                          UIHelper.verticalSpaceMedium,
                          TextFormFieldWidget(
                            title: 'Account name',
                            readOnly: true,
                            controller: TextEditingController()
                              ..text = 'Mary Esther',
                          ),
                          UIHelper.verticalSpaceMedium,
                          TextFormFieldWidget(
                              title:
                                  'IBAN number (Only for international transactions)'),
                          UIHelper.customVerticalSpace(24.0),
                        ],
                      )
                  ],
                ),
              if (selectedBank != null && selectedCurrency != null)
                //:todo long button goes here
                TextButton(
                  onPressed: () {},
                  child: SimpleText('text'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class WithdrawalRestrictionsCard extends StatelessWidget {
  const WithdrawalRestrictionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width(196),
      height: SizeConfig.height(70),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.appBlack.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleText(
              'Minimum withdrawal amount',
              size: 12,
              weight: FontWeight.w600,
              color: AppColors.appBlackVariant,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(8),
              ),
              child: Divider(),
            ),
            Row(
              children: [
                UIHelper.horizontalSpaceMedium,
                SimpleText(
                  '\$ 500',
                  size: 12,
                  weight: FontWeight.w600,
                  color: AppColors.appBlackVariant,
                ),
                UIHelper.customHorizontalSpace(50.0),
                AppCurrencyWithLabel(
                  fontSize: 12,
                  size: 10,
                  color: AppColors.appBlackVariant,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
