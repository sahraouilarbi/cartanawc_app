import 'package:cartanawc_app/presentation/ressources/color_manager.dart';
import 'package:flutter/material.dart';

class MyTextFormFieldWidget extends StatelessWidget {
  const MyTextFormFieldWidget({
    Key key,
    this.textEditingController,
    this.initialValue,
    this.textInputType,
    this.hintText,
    this.labelText,
    this.errorText,
    this.suffixIcon,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String initialValue;
  final TextInputType textInputType;
  final String hintText;
  final String labelText;
  final String errorText;
  final IconButton suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      initialValue: initialValue,
      keyboardType: textInputType,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorText: errorText,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.greenAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
