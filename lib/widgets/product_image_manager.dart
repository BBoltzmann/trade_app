import 'package:flutter/material.dart';
import 'package:trade_app/utils/margins.dart';

Widget productImage(List<String> images) {
  if (images.length == 1) {
    return Image.network(
      images.first,
      height: height(250),
      fit: BoxFit.fitWidth,
      width: width(350),
    );
  }
  if (images.length == 2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              images.first,
              height: height(250),
              fit: BoxFit.fitWidth,
              width: width(350),
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Image.network(
              images.last,
              height: height(250),
              fit: BoxFit.fitWidth,
              width: width(350),
            ),
          ),
        ],
      ),
    );
  }
  if (images.length == 3) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              images[0],
              height: height(250),
              fit: BoxFit.fitWidth,
              width: width(350),
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              children: [
                Image.network(
                  images[1],
                  height: height(125),
                  fit: BoxFit.fitWidth,
                  width: width(350),
                ),
                verticalSpaceSmall,
                Image.network(
                  images.last,
                  height: height(125),
                  fit: BoxFit.fitWidth,
                  width: width(350),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  if (images.length > 3) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              images[0],
              height: height(250),
              fit: BoxFit.fitWidth,
              width: width(350),
            ),
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Column(
              children: [
                Image.network(
                  "${images[1]}",
                  height: height(125),
                  fit: BoxFit.fitWidth,
                  width: width(350),
                ),
                verticalSpaceSmall,
                Stack(
                  children: [
                    // Center(child: Text("+${images.length - 3}", style: TextStyle(color: Colors.white, fontSize: 20),),),
                    Image.network(
                      images.last,
                      height: height(125),
                      fit: BoxFit.fitWidth,
                      width: width(350),
                    ),
                    Positioned(
                      top: height(45),
                      left: width(70),
                      child: Text(
                        "+${images.length - 3}",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
