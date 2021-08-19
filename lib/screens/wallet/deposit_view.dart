import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trade_app/screens/wallet/widgets/custom_selection_dropdown.dart';
import 'package:trade_app/screens/wallet/widgets/wallet_card.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/sizable_scaffold.dart';
import 'package:trade_app/widgets/size_config.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class DepositView extends StatefulWidget {
  const DepositView({Key? key}) : super(key: key);

  @override
  _DepositViewState createState() => _DepositViewState();
}

class _DepositViewState extends State<DepositView> {
  String? selectedMode;
  String? selectedCurrency;
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
                    'Deposit',
                    size: 18,
                    color: AppColors.appBlack,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              UIHelper.verticalSpaceMediumPlus,
              WalletCard(),
              UIHelper.customVerticalSpace(24.0),
              UIHelper.customVerticalSpace(16.0),
              CustomSelectionDropdown(
                label: 'Select Mode',
                onCurrencySelected: (value) {
                  setState(() {
                    selectedMode = value;
                  });
                },
                dropdownList: [
                  'Card',
                  'Coin/Cryptocurrency',
                ],
              ),
              if (selectedMode != null)
                Column(
                  children: [
                    TextFormFieldWidget(
                      readOnly: true,
                      controller: TextEditingController()..text = selectedMode!,
                    ),
                    UIHelper.verticalSpaceMedium,
                    CustomSelectionDropdown(
                      onCurrencySelected: (value) {
                        setState(() {
                          selectedCurrency = value;
                        });
                      },
                    ),
                  ],
                ),
              if (selectedCurrency != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormFieldWidget(
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
                  ],
                ),
              if (selectedMode != null && selectedCurrency != null)
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
