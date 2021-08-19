import 'package:flutter/material.dart';
import 'package:trade_app/widgets/size_config.dart';

class SizeableScaffold extends StatelessWidget {
  const SizeableScaffold(
      {Key? key,
      required this.body,
      this.appBar,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset})
      : super(key: key);
  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
