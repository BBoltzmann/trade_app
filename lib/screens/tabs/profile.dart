import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/models/iresponse.dart';
import 'package:trade_app/models/user.dart';
import 'package:trade_app/widgets/BrandDivider.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends StateMVC<ProfileScreen> {
  UserController _con = new UserController();

  _ProfileScreenState() : super(UserController()) {
    _con = controller;
  }
  FlutterSecureStorage storage = FlutterSecureStorage();
  OverlayEntry loader;

  User _user;
  final _nameField = TextEditingController();
  final _aboutField = TextEditingController();
  final _phoneField = TextEditingController();
  final _emailField = TextEditingController();
  String country, city;

  void _getUserProfile() async {
    final IResponse<User> profileResponse = await _con.getUserProfile();
    print({'======/////////========${profileResponse.data}'});

    _user = profileResponse?.data;
    // setState(() {});

    _nameField.text = '${_user?.firstname} ${_user?.lastname}';
    _phoneField.text = _user?.phone;
    _emailField.text = _user?.email ?? 'example@email.com';
    _aboutField.text = _user?.bio;
    country = _user?.country;
    city = _user?.city;
    setState(() {});

    storage.write(key: "uid", value: _user.uuid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarWidget(
            leading: true,
            title: 'My Profile',
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: (_con.fetchingAddresses && _user == null)
              ? Center(
                  child: SpinKitThreeBounce(
                  color: appColor,
                  size: 30.0,
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Stack(children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              // child: Icon(Icons.person_add),
                            ),
                          ),
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Icon(Icons.add_circle,
                                  size: 25, color: appColor),
                            ),
                          ),
                        ))
                      ]),
                      SizedBox(width: 20),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: Container(
                                child: TextField(
                                  maxLines: null,
                                  controller: _nameField,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'John Doe',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                  cursorColor: appColor,
                                ),
                              ),
                            ),
                            Text(_user.phone,
                                style: TextStyle(color: Colors.grey))
                          ]),
                      Spacer(),
                      Icon(Icons.done_outlined, color: appColor),
                    ]),
                    SizedBox(height: 20),
                    BrandDivider(),
                    SizedBox(height: 20),
                    Text('About:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: Container(
                        child: TextField(
                          maxLines: null,
                          controller: _aboutField,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Add a bio',
                              hintStyle: TextStyle(color: Colors.grey)),
                          cursorColor: appColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BrandDivider(),
                    BrandDivider(),
                    SizedBox(height: 20),
                    Row(children: [
                      Text('Email:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      SizedBox(width: 10),
                      Text('kristine@example.com',
                          style: TextStyle(fontSize: 16))
                    ]),
                    SizedBox(height: 10),
                    Row(children: [
                      Text('Location:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      SizedBox(width: 10),
                      Text('24 Alle Avenue, Hampton',
                          style: TextStyle(fontSize: 16))
                    ]),
                    SizedBox(height: 10),
                    Row(children: [
                      Text('Total Trade Rate:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      SizedBox(width: 10),
                      Row(children: [
                        Icon(Icons.star, color: Colors.orangeAccent),
                        SizedBox(width: 5),
                        Icon(Icons.star, color: Colors.orangeAccent),
                        SizedBox(width: 5),
                        Icon(Icons.star, color: Colors.orangeAccent),
                        SizedBox(width: 5),
                        Icon(Icons.star, color: Colors.orangeAccent),
                        SizedBox(width: 5),
                        Icon(Icons.star_outline, color: Colors.orangeAccent),
                      ]),
                    ]),
                    SizedBox(height: 20),
                    BrandDivider(),
                    SizedBox(height: 20),
                    Text('Trade History',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Completed', style: TextStyle(fontSize: 16)),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Center(
                                  child: Text('20',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Bold')),
                                ),
                              )),
                        ]),
                    SizedBox(height: 10),
                    BrandDivider(),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Ongoing', style: TextStyle(fontSize: 16)),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Center(
                                  child: Text('12',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Bold')),
                                ),
                              )),
                        ]),
                    SizedBox(height: 10),
                    BrandDivider(),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Incomplete', style: TextStyle(fontSize: 16)),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Center(
                                  child: Text('2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Bold')),
                                ),
                              )),
                        ]),
                    SizedBox(height: 10),
                    BrandDivider(),
                    SizedBox(height: 510),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dispute', style: TextStyle(fontSize: 16)),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                child: Center(
                                  child: Text('6',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Bold')),
                                ),
                              )),
                        ]),
                  ],
                ),
        ),
      ),
    );
  }
}
