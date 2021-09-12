import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/sizable_scaffold.dart';
import 'package:trade_app/widgets/size_config.dart';

class SecurityCodeView extends StatelessWidget {
  const SecurityCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeableScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.width(20),
            right: SizeConfig.width(20),
            top: SizeConfig.height(61),
          ),
          child: Column(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(9),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_left,
                  color: AppColors.appBlack,
                ),
              ),
              UIHelper.customVerticalSpace(46.0),
              SimpleText(
                'Security Code',
                size: 24,
                weight: FontWeight.w700,
              ),
              UIHelper.verticalSpaceSmall,
              SimpleText(
                'Please enter the security code sent to your email address for verification',
              ),
              UIHelper.customVerticalSpace(150.0),
              //:todo pin code field goes here
              UIHelper.customVerticalSpace(50.0),
              //:todo long button goes here
            ],
          ),
        ),
      ),
    );
  }
}
