import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:trade_app/globalvariables.dart';
import 'package:trade_app/helpers/utility.dart';
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
    token: json.decode(res.body)['access_token'],
    uuid: json.decode(res.body)['user_id'],
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
      token: json.decode(res.body)['access_token']);

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
