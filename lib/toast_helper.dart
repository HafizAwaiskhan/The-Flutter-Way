import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastHelper {
  static void showToast(BuildContext context, String message) {
    showToastWidget(
      Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.red,
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.center,
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}