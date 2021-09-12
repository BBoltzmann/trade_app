import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/size_config.dart';

class ShortButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color? labelColor;
  final Color? buttonColor;
  final bool outlined;
  final Widget? icon;
  const ShortButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.buttonColor,
      this.labelColor,
      this.icon,
      this.outlined = false})
      : super(key: key);
  Widget labelWidget() => Text(
        label,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          color: labelColor ?? AppColors.primaryMain50,
          fontSize: SizeConfig.textSize(14),
          fontWeight: FontWeight.w500,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: SizeConfig.height(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: buttonColor ?? AppColors.appWhite,
              border: outlined
                  ? Border.all(
                      color: AppColors.primaryMain50,
                    )
                  : null),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width(14),
            //  vertical: SizeConfig.height(10),
          ),
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon!,
                    UIHelper.customHorizontalSpace(7.0),
                    labelWidget(),
                  ],
                )
              : Center(child: labelWidget()),
        ),
      ),
    );
  }
}
