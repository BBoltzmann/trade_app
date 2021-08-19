import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/models/iresponse.dart';
import 'package:trade_app/models/user.dart';
import 'package:trade_app/screens/pages/edit_profile.dart';
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
  final picker = ImagePicker();
  String _imagePath;

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

  Future pickImageFromGallery() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 30);

    if (pickedFile != null) {
      // _userRegistration.localProfilePhotoPath = pickedFile.path;
      print(pickedFile.path);
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: AppBarWidget(
            leading: true,
            title: '',
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              //  (_con.fetchingAddresses && _user == null)
              //     ?
              // Center(
              //     child: SpinKitThreeBounce(
              //     color: appColor,
              //     size: 30.0,
              //   ))
              // :
              Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()));
                    },
                    child: Icon(Icons.edit, color: Colors.white),
                    mini: true,
                    backgroundColor: appColor,
                    elevation: 5),
              ),
              Image.asset('assets/images/user_photo.png'),
              SizedBox(height: 10),
              Text('Celine Jones',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Text('Lagos, Nigeria'),
              SizedBox(height: 8),
              Text('I am a trader and would love to trade with you',
                  style: TextStyle(color: Colors.grey)),
              SizedBox(height: 60),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/handshake.svg'),
                            SizedBox(height: 3),
                            Text('20',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins-Bold')),
                            SizedBox(height: 5),
                            Text('Handshakes',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins-Bold')),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 10),
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/ongoing.svg'),
                            SizedBox(height: 3),
                            Text('12',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins-Bold')),
                            SizedBox(height: 5),
                            Text('Ongoing',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins-Bold')),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 10),
                Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/dispute.svg'),
                            SizedBox(height: 3),
                            Text('2',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Poppins-Bold')),
                            SizedBox(height: 5),
                            Text('Disputes',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins-Bold')),
                          ],
                        ),
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
