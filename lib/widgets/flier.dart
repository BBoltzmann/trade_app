import 'package:flutter/material.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/product_image_manager.dart';

Widget flier(
    {@required String avatar,
  
      @required String title,
      @required String userName,
    @required String time,
    @required String location,
    @required String price,
    @required List<String> images,
    @required String description,
    @required String likeCount,
    @required String commentCount}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Container(
      height: height(420),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                      radius: 25,
                    ),
                    horizontalSpaceSmall,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          time,
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      location,
                      style: TextStyle(),
                    ),
                    Text(price),
                  ],
                ),
              ],
            ),
          ),
          productImage(
            images
          ),
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              child: Text(
              description)
            ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/like.png"),
                        ),
                        Text(likeCount)
                      ],
                    ),
                    horizontalSpaceSmall,
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/comment.png"),
                        ),
                        Text(commentCount)
                      ],
                    ),
                  ],
                ),
                Container(
                  width: width(70),
                  height: height(30),
                  decoration: BoxDecoration(
                      border: Border.all(color: appColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "Trade",
                      style: TextStyle(color: appColor, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
