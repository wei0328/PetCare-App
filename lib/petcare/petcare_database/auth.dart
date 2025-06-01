// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pet_care/petcare/petcare_constants/app_config.dart';
import 'package:pet_care/petcare/petcare_constants/snack_bars.dart';
import 'package:pet_care/petcare/petcare_models/log_in_model.dart';
import 'package:pet_care/petcare/petcare_models/sign_up_model.dart';

import 'network_handler.dart';

class AuthenticationApi {
  var logger = Logger();

  Future? signUp(
    BuildContext context, {
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    };

    var map = <String, dynamic>{};

    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["phoneNumber"] = phoneNumber;
    map["email"] = email;
    map["password"] = password;

    try {
      final response = await http.post(Uri.parse(AppConfig.signUp), body: jsonEncode(map), headers: requestHeaders);
      debugPrint(AppConfig.signUp);
      logger.d(response.body);
      if (response.statusCode == 200) {
        return UserResponse.fromJson(jsonDecode(response.body));
      } else {
        // debugPrint('error');
        dynamic error = jsonDecode(response.body);

        customErrorSnackBar(context, error['description']);
        return null;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future? login(BuildContext context, {required String email, required String password}) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/x-www-form-urlencoded",
      "Access-Control-Allow-Origin": "*",
    };

    var map = <String, dynamic>{};
    map["username"] = email;
    map["password"] = password;
    map["grant_type"] = "password";
    map["client_id"] = "petCare-system";
    map["client_secret"] = "f808dde4-2fee-4ab0-9c3c-22c3206c105a";
    map["scope"] = "offline_access";

    var encodedBody = map.keys.map((key) => '$key=${Uri.encodeComponent(map[key])}').join('&');

    try {
      final response = await http.post(
        Uri.parse(AppConfig.login),
        body: encodedBody,
        headers: requestHeaders,
      );

      // debugPrint(AppConfig.login);
      // logger.d(response.body);
      if (response.statusCode == 200) {
        return AccessTokenResponse.fromJson(jsonDecode(response.body));
      } else {
        dynamic error = jsonDecode(response.body);

        customErrorSnackBar(
          context, 
          statusCodeErrors(response.statusCode, error),
        );

        return null;
      }
    } catch (exception) {
      debugPrint('Exception error on login() - ${exception.toString()}');

      return Future.error(exception.toString());
    }
  }

  Future? postRequest(BuildContext context, {required String url, required Map<String, dynamic> body}) async {
    try {
      var encodedBody = body.keys.map((key) => '$key=${Uri.encodeComponent(body[key])}').join('&');

      final response = await http.post(
        Uri.parse(url),
        body: encodedBody,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Accept": "application/x-www-form-urlencoded",
          "Access-Control-Allow-Origin": "*",
        },
      );

      if (response.statusCode == 200) {
        print("response success");
        print(response.body);

        return jsonDecode(response.body);
      } else {
        print("response error");
        print(response.body);
        dynamic error = jsonDecode(response.body);
        customErrorSnackBar(
          context,
          statusCodeErrors(response.statusCode, error),
        );
        return null;
      }
    } catch (exception) {
      debugPrint('Exception error on postRequest() - ${exception.toString()}');

      return Future.error(exception.toString());
    }
  }
}
