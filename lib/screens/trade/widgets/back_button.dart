import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TradeBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const TradeBackButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset("assets/images/arrow-left.svg"),
    );
  }
}
