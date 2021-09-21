import 'package:cartanawc_app/utils/theme_config.dart';
import 'package:flutter/material.dart';

class FormHelper {
  static Widget textInput(
    BuildContext context,
    Object initialValue,
    Function onChanged, {
    bool isTextArea = false,
    bool isNumberInput = false,
    bool obscureText = false,
    Function onValidate,
    Widget prefixIcon,
    Widget suffixIcon,
    bool readOnly = false,
  }) {
    return TextFormField(
      initialValue: initialValue != null ? initialValue.toString() : '',
      decoration: fieldDecoration(
        context,
        "",
        "",
        suffixIcon: suffixIcon,
      ),
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: !isTextArea ? 1 : 3,
      keyboardType: isNumberInput ? TextInputType.number : TextInputType.text,
      onChanged: (String value) {
        return onChanged(value);
      },
      validator: (value) {
        return onValidate(value) as String;
      },
    );
  }

  static InputDecoration fieldDecoration(
    BuildContext context,
    String hintText,
    String helperText, {
    Widget prefixIcon,
    Widget suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(6.0),
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeConfig.cartanaColorGrey),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeConfig.cartanaColorGrey),
      ),
    );
  }

  static Widget fieldLabel(String labelName,
      {Color labelColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
        labelName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //fontSize: 15.0,
          color: labelColor,
        ),
      ),
    );
  }

  static Widget fieldLabelValue(BuildContext context, String labelName) {
    return FormHelper.textInput(
      context,
      labelName,
      (value) => {},
      onValidate: (value) {
        return null;
      },
      readOnly: true,
    );
  }

  static Widget saveButton(
    String buttonText,
    Function onTap, {
    String color,
    String textColor,
    bool fullWidth,
  }) {
    return SizedBox(
      height: 50.0,
      width: 150.0,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent,
            ),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void showMessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function onPressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                return onPressed();
              },
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }
}
