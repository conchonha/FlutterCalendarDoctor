import 'package:flutter_base/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool readOnly;
  final int? maxLength;
  final bool? enable;

  const AppTextField(
      {Key? key,
      required this.hint,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.nextFocus,
      this.readOnly = false,
      this.maxLength,
      this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        focusNode: focusNode,
        validator: validator,
        textAlign: TextAlign.start,
        maxLength: maxLength,
        textInputAction: textInputAction,
        maxLines: 1,
        keyboardAppearance: Brightness.light,
        controller: controller,
        keyboardType: keyboardType,
        onFieldSubmitted: (value) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
          errorStyle: const TextStyle(height: 1),
          border: AppStyle.inputBorder,
          focusedBorder: AppStyle.focusBorder,
          disabledBorder: AppStyle.inputBorder,
          enabledBorder: AppStyle.inputBorder,
          errorBorder: AppStyle.errBorder,
          focusedErrorBorder: AppStyle.focusErrBorder,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
