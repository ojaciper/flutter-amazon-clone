import 'dart:convert';
import 'package:amazon_clone/constant/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      snackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      snackBar(context, jsonDecode(response.body)['error']);

      break;
    default:
      snackBar(context, response.body);
  }
}
