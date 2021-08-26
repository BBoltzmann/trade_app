import 'package:flutter/material.dart';
import 'package:trade_app/widgets/size_config.dart';

enum MessageTypes {
  info,
  error,
}
const imageIconsPath = 'assets/icons';
const imagesPath = 'assets/icons';
Color appColor = Color(0xff0062B8);
EdgeInsetsGeometry appPadding(
        {double? left, double? right, double? top, double? bottom}) =>
    EdgeInsets.only(
      left: SizeConfig.width(left ?? 0),
      right: SizeConfig.width(right ?? 0),
      top: SizeConfig.height(top ?? 0),
      bottom: SizeConfig.height(bottom ?? 0),
    );

const heartIcon = AssetImage('$imageIconsPath/heart_icon.png');
const chatBoxIcon = AssetImage('$imageIconsPath/chat_box_icon.png');
const messageIcon = AssetImage('$imageIconsPath/message_icon.png');
const tagIcon = AssetImage('$imageIconsPath/tag.png');
const menuIcon = AssetImage('$imageIconsPath/menu_icon.png');
const searchIcon = AssetImage('$imageIconsPath/search.png');
const optionsIcon = AssetImage('$imageIconsPath/more-vertical.png');
const aboutIcon = AssetImage('$imageIconsPath/help-circle.png');
const contactIcon = AssetImage('$imageIconsPath/phone-call.png');
const logoutIcon = AssetImage('$imageIconsPath/logout.png');
const creditCardIcon = AssetImage('$imageIconsPath/credit-card.png');
const faqIcon = AssetImage('$imageIconsPath/faq-icon.png');
const settingsIcon = AssetImage('$imageIconsPath/settings.png');
