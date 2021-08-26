import 'package:flutter/material.dart';
import 'package:trade_app/widgets/constants.dart';

class NotificationsTile extends StatelessWidget {
  String title;

  NotificationsTile({required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(1),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 2.0,
                spreadRadius: 0,
                offset: Offset(0.7, 0.7)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(title, style: TextStyle(fontSize: 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Just now', style: TextStyle(fontSize: 13)),
            ),
            Container(
              height: 80,
              width: 50,
              decoration: BoxDecoration(
                color: appColor.withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(1),
                ),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey[400],
                //       blurRadius: 2.0,
                //       spreadRadius: 0,
                //       offset: Offset(0.7, 0.7))
                // ]
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10)
    ]);
  }
}
