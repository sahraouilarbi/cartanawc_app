import 'package:cartanawc_app/core/extensions.dart';
import 'package:flutter/material.dart';

class Utils {
  void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function() onPressed, {
    bool isConfirmationDialog = false,
    String buttonText2 = kEMPTY,
    Function()? onPressed2,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
            Visibility(
              visible: isConfirmationDialog,
              child: TextButton(
                onPressed: onPressed2,
                child: Text(buttonText2),
              ),
            )
          ],
        );
      },
    );
  }
}

void printDebugMessage(String message) {
  debugPrint(message);
}
