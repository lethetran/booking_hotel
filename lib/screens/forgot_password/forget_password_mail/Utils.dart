import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(String message, BuildContext context, {SnackBarAction? action}) {
    final snackBar = SnackBar(
      content: Text(message),
      action: action,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}