import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:trade_app/globalvariables.dart';
import 'package:trade_app/helpers/locator.dart';
import 'package:trade_app/models/iresponse.dart';
import 'package:trade_app/models/user.dart';

const headers = {
  "content-type": "application/json",
  "accept": "application/json",
};

Future<IResponse<User>> login(User user) async {
  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  var res = await http.post(
    Uri.parse('https://wole-api.herokuapp.com/api/Auth/login'),
    body: json.encode(user.loginCredentials()),
    headers: headers,
  );
  IResponse<User> alRes = IResponse(
      statusCode: res.statusCode,
      message: json.decode(res.body)['message'],
      success: json.decode(res.body)['success'],
      token: json.decode(res.body)['data']['token'],
      uuid: json.decode(res.body)['data']['userId'],
      isProfileCompleted: json.decode(res.body)['isProfileCompleted']);

  // TODO: Remove, Inherit from Interceptor
  switch (res.statusCode) {
    case 200:
    case 409:
      alRes.data = User.fromJSON(json.decode(res.body));
      break;
    default:
      break;
  }

  print(res.statusCode);

  return alRes;
}

Future<IResponse<User>> userSignUp(User user) async {
  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  var res = await http.post(
    Uri.parse('https://wole-api.herokuapp.com/api/Auth/register'),
    body: json.encode(user.toMap()),
    headers: headers,
  );
  if (res.body.isNotEmpty) {
    print(json.decode(res.body));
  } else {
    print('---------No results-------');
  }

  final Map data = json.decode(res.body);
  IResponse<User> alRes = IResponse(
      statusCode: res.statusCode,
      message: json.decode(res.body)['message'],
      success: json.decode(res.body)['success'],
      uuid: json.decode(res.body)['userId'],
      isProfileCompleted: json.decode(res.body)['isProfileCompleted'],
      token: json.decode(res.body)['token']);

  // TODO: Remove, Inherit from Interceptor
  switch (res.statusCode) {
    case 200:
    case 409:
      alRes.data = User.fromJSON(data['data']);
      // alRes.token = data['access_token'];
      break;
    default:
      break;
  }
  print(res.statusCode);
  print(res.body);
  return alRes;
}

Future<IResponse<User>?> getUserProfile() async {
  try {
    FlutterSecureStorage storage = getIt<FlutterSecureStorage>();

    Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json",
      "authorization": 'Bearer ${await storage.read(key: 'token')}',
    };

    var res = await http.get(
      Uri.parse('https://wole-api.herokuapp.com/api/User/me'),
      headers: headers,
    );
    print(res.body);
    final Map<String, dynamic>? data = json.decode(res.body)['data'];

    if (data != null && data is Map) {
      final alRespose = IResponse<User>.fromJson(data);
      alRespose.data = User.fromJSON(data);
      print('--- getUserDetails success');
      return alRespose;
    }
  } catch (e) {
    print('--- getUserDetails error');
    print(e);
    return null;
  }
}

Future<IResponse<User>> resetPassword(String phone) async {
  final storage = getIt<FlutterSecureStorage>();
  final token = await storage.read(key: 'token');

  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
    "Authorization": "Bearer $token",
  };

  var res = await http.post(
    Uri.parse('$url/Auth/reset-password'),
    body: json.encode({'phone': phone}),
    headers: headers,
  );

  IResponse<User> alRes = IResponse(
    statusCode: res.statusCode,
    message: json.decode(res.body),
  );

  // TODO: Remove, Inherit from Interceptor
  switch (res.statusCode) {
    case 200:
    case 409:
      alRes.data = User.fromJSON(json.decode(res.body));
      break;
    default:
      break;
  }

  print(res.statusCode);
  print(res.body);

  return alRes;
}

Future<IResponse<User>> changePassword(
    String password, passwordConfirmation, userID) async {
  Map<String, String> headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  var res = await http.post(
    Uri.parse('$url/Auth/change-password'),
    body: json.encode({
      'password': password,
      'password_confirmation': passwordConfirmation,
      'user_id': userID
    }),
    headers: headers,
  );

  IResponse<User> alRes = IResponse(
    statusCode: res.statusCode,
    message: json.decode(res.body),
  );

  // TODO: Remove, Inherit from Interceptor
  switch (res.statusCode) {
    case 200:
    case 409:
      alRes.data = User.fromJSON(json.decode(res.body));
      break;
    default:
      break;
  }

  print(res.statusCode);
  print(res.body);

  return alRes;
}
