// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_constants/snack_bars.dart';

class NetworkHandler {
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
        return jsonDecode(response.body);
      } else {
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

String statusCodeErrors(int statusCode, dynamic response) {
  switch (statusCode) {
    case 400:
      return response['error_description'];

    default:
      return response['description'];
  }
}
