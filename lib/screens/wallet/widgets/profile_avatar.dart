import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/widgets/size_config.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar(
      {Key? key, this.width, this.imageFromFile, this.imposedUrl})
      : super(key: key);
  final double? width;
  final File? imageFromFile;
  final String? imposedUrl;
  double iconSize() {
    if (width != null) {
      return width! / 2;
    }
    return 80;
  }

  Widget? getBody({String? imageUrl}) {
    // if (imageFromFile == null && imageUrl == null)
    //   return Center(
    //     child: Icon(
    //       Icons.person_rounded,
    //       size: iconSize(),
    //       color: Colors.black.withOpacity(0.38),
    //     ),
    //   );
  }

  DecorationImage? getImage({String? imageUrl}) {
    if (imageFromFile != null || imageUrl != null || imposedUrl != null) {
      ImageProvider getImageProvider() {
        if (imposedUrl != null) {
          return NetworkImage(imposedUrl!);
        } else if (imageUrl != null) {
          return NetworkImage(imageUrl);
        } else {
          return FileImage(imageFromFile!);
        }
      }

      return DecorationImage(
        image: getImageProvider(),
        fit: BoxFit.cover,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height(width ?? 40),
      width: SizeConfig.height(width ?? 40),
      decoration: BoxDecoration(
        color: AppColors.grey1,
        shape: BoxShape.circle,
        image: getImage(),
      ),
      child: getBody(),
    );
  }
}
