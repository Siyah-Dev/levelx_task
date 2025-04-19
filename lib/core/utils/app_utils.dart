import 'package:flutter/material.dart';

class AppUtils {
  static void showSnackbar(BuildContext context, String? message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? "", style: TextStyle(color: Colors.white)),
        backgroundColor: color,
      ),
    );
  }
}
