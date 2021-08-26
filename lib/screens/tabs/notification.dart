import 'package:flutter/material.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/notifications_tile.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              leading: true,
              title: 'Notifications',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Notifications',
                //     style:
                //         TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                // SizedBox(height: 10),
                NotificationsTile(title: 'Your wallet was debited'),
                NotificationsTile(title: 'You changed your username'),
                NotificationsTile(title: 'Omar sent you a message'), 

              ],
            ),
          ),
        ));
  }
}
