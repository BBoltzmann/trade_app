import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/trade/widgets/back_button.dart';
import 'package:trade_app/screens/trade/widgets/trade_button.dart';
import 'package:trade_app/screens/trade/post/trade_post_review.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/image_picker.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/text_style.dart';
import 'package:trade_app/widgets/text_widget.dart';

class TradePostScreen extends StatefulWidget {
  const TradePostScreen({Key key}) : super(key: key);

  @override
  _TradePostScreenState createState() => _TradePostScreenState();
}

class _TradePostScreenState extends State<TradePostScreen> {
  File image = File("");
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          verticalSpace(61),
          Container(
            height: height(40),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TradeBackButton(onTap: () {
                    Navigator.pop(context);
                  }),
                  TradeButton(
                    "Review",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TradePostReviewScreen(
                            image: image,
                            description: description.text,
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          verticalSpace(12),
          Container(
            height: height(40),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height(36.1),
                  width: width(36.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200/300"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(3.92),
          Container(
            height: height(184),
            width: width(334),
            decoration: BoxDecoration(
              color: searchBarGrey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: image.path == ""
                ? Center(
                    child: CustomText(
                      "Insert An Image",
                    ),
                  )
                : Image.file(
                    image,
                    fit: BoxFit.fill,
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              height: height(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          children: [
                            InkWell(
                              onTap: () async {
                                final takenImage = await takeImage();
                                setState(() {
                                  image = takenImage;
                                });
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: CustomText(
                                  "Take Photos",
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            InkWell(
                              onTap: () async {
                                final pickedImage = await selectImage();
                                setState(() {
                                  image = pickedImage;
                                });
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: CustomText(
                                  "Choose From Gallery",
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: CustomText(
                                  "Cancel",
                                  fontSize: 14,
                                  textColor: red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset("assets/images/camera.svg"),
                        CustomText(
                          "Add Photo",
                          textColor: paleBlueDark,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(28),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Card(
              child: Container(
                height: 100.h,
                width: 335.w,
                child: TextFormField(
                  controller: description,
                  maxLines: 10,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: "What do you want?... 160 characters max",
                    hintStyle: style(
                      fontSize: 8,
                      weight: FontWeight.w400,
                      textColor: back_arrow_grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // verticalSpace(16),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20.w),
          //   height: height(80),
          //   child: Row(
          //     children: [
          //       Column(
          //         children: [
          //           CustomText("Amount (NGN)", fontSize: 14,),

          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
