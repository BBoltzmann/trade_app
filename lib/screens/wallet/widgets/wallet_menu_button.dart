import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

class WalletMenuButton extends StatelessWidget {
  const WalletMenuButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);
  final Widget icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.height(134),
        padding: EdgeInsets.only(
          left: SizeConfig.width(18),
          top: SizeConfig.height(22),
          bottom: SizeConfig.height(22),
        ),
        decoration: BoxDecoration(
          color: AppColors.appWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 10,
              color: AppColors.appBlack.withOpacity(0.15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Spacer(),
            SimpleText(label),
          ],
        ),
      ),
    );
  }
}
