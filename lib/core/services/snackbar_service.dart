import 'package:flutter/material.dart';

class SnackbarService {
  static final messengerKey =
  GlobalKey<ScaffoldMessengerState>();

  static void showSuccess(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showError(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showWarning(String message) {
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange,
      ),
    );
  }
}