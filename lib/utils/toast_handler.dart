import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHandler {
  void showWizardError(String message) {
    Fluttertoast.showToast(
      msg: "⚠️Failed! Something went wrong. ⚠️ $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor: "linear-gradient(to right, #4b134f, #c94b4b)",
      timeInSecForIosWeb: 3,
      webPosition: "center",
      webShowClose: false,
    );
  }
}
