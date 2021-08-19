import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/models/iresponse.dart';
import 'package:trade_app/models/user.dart';
import 'package:trade_app/repository/user_repository.dart' as user_repo;
import 'package:trade_app/screens/home.dart';
import 'package:trade_app/widgets/constants.dart';

class UserController extends ControllerMVC {
  User user = new User();
  String? confirmedPassword;
  String? token;

  late GlobalKey<ScaffoldState> scaffoldKey;
  late GlobalKey<FormState> loginFormKey, registerFormKey;
  late OverlayEntry verificationOverlay, loader;
  late FlutterSecureStorage storage;
  var fetchingAddresses = true;

  bool verificationActive = false, autoValidate = false, hidePassword = true;

  UserController() {
    loginFormKey = new GlobalKey<FormState>();
    registerFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    storage = getIt<FlutterSecureStorage>();

    getUserProfile();
  }

  login() async {
    try {
      loader = Utility.load(scaffoldKey.currentContext!);

      IResponse<User> res = await user_repo.login(user);

      print({'======/////////========${res.token}'});
      print({'======/////////========${res.uuid}'});
      if (res.success == true) {
        storage.write(key: "token", value: res.token);

        storage.write(key: "uid", value: res.data!.uuid);
        Navigator.of(scaffoldKey.currentContext!).pushReplacementNamed(
          HomeScreen.route,
          arguments: 0,
        );
        loader.remove();
      } else {
        Utility.showMessage(
          scaffoldKey.currentContext!,
          message: res.message,
        );
        loader.remove();
      }
    } catch (e) {
      print(e);
    }
  }

  void register() async {
    loader = Utility.load(scaffoldKey.currentContext!);
    print(user.toMap());
    IResponse<User> res = await user_repo.userSignUp(user);

    if (res.success == true) {
      storage.write(key: "uid", value: res.uuid);
      storage.write(key: "token", value: res.token);
      storage.write(key: "firstname", value: res.data!.firstname);
      storage.write(key: "firstname", value: res.data!.lastname);
      storage.write(key: "phoneNumber", value: res.data!.phone);
      storage.write(key: "country", value: res.data!.country);
      storage.write(key: "state", value: res.data!.state);
      storage.write(key: "city", value: res.data!.city);
      storage.write(key: "email", value: res.data!.email);
      storage.write(key: "password", value: res.data!.password);
      print(res.message);
      print(res.success);

      Navigator.of(scaffoldKey.currentContext!).pushNamedAndRemoveUntil(
        HomeScreen.route,
        (route) => false,
      );
      loader.remove();
    } else {
      print(res.message);
      print(res.success);
      Utility.showMessage(
        scaffoldKey.currentContext!,
        message: res.message.toString(),
        type: MessageTypes.error,
      );
      loader.remove();
    }
  }

  Future getUserProfile() async {
    if (!fetchingAddresses) {
      setState(() {
        // loader = Utility.load(scaffoldKey?.currentContext);
        fetchingAddresses = true;
      });
    }

    final res = await user_repo.getUserProfile();
    setState(() {
      fetchingAddresses = true;
    });

    print(res?.data);
    return res;
  }

  void togglePasswordVisibility() {
    setState(() => hidePassword = !hidePassword);
  }
}
