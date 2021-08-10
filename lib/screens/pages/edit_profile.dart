import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/models/iresponse.dart';
import 'package:trade_app/models/user.dart';
import 'package:trade_app/widgets/BrandDivider.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends StateMVC<EditProfileScreen> {
  UserController _con = new UserController();

  _EditProfileScreenState() : super(UserController()) {
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
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              automaticallyImplyLeading: true,
              elevation: 0,
              title: Text('Edit Profile',
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.bold)),
              actions: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Text('Done',
                        style: TextStyle(color: appColor, fontSize: 16)))
              ],
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black))),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/user_photo.png')),
              SizedBox(height: 10),
              Center(
                  child: Text('Select Profile Picture',
                      style: TextStyle(color: appColor))),
              SizedBox(height: 30),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Name', style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Container(
                    width: 250,
                    child: TextFormField(
                        cursorColor: appColor,
                        initialValue: 'Celine Jones',
                        decoration: InputDecoration()
                        // onChanged: (String input) => _con.user.password = input,
                        ))
              ]),
              SizedBox(height: 10),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Username', style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Container(
                    width: 250,
                    child: TextFormField(
                      cursorColor: appColor,
                      initialValue: 'Tricky Bee',
                      decoration: InputDecoration(),
                      // onChanged: (String input) => _con.user.password = input,
                    ))
              ]),
              SizedBox(height: 10),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text('Bio', style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Container(
                    width: 250,
                    child: TextFormField(
                      cursorColor: appColor,
                      initialValue: 'Tricky Bee',
                      decoration: InputDecoration(),
                      // onChanged: (String input) => _con.user.password = input,
                    ))
              ]),
              SizedBox(height: 50),
              // BrandDivider(),
              // SizedBox(height: 20),
              Row(children: [
                Text('Allow Notifications', style: TextStyle(fontSize: 16)),
                Spacer(),
                SwitcherButton(
                  value: true,
                  offColor: Colors.grey[300],
                  onColor: Colors.green,
                  onChange: (value) {
                    print(value);
                  },
                )
              ]),
              SizedBox(height: 20),

              Row(children: [
                Text('Access Location', style: TextStyle(fontSize: 16)),
                Spacer(),
                SwitcherButton(
                  value: true,
                  offColor: Colors.grey[300],
                  onColor: Colors.green,
                  onChange: (value) {
                    print(value);
                  },
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
