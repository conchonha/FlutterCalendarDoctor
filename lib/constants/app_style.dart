import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_constants.dart';

class AppStyle {
  static final textStyleAppBar = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: AppConstants.openSanFont);
  // focus textformfield
  static final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColor.h44A1FF));
  // border , disble , enable
  static final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColor.hB8B8B8));

  static final borderTF = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColor.h5E5E5E));

  // err textformfield
  static const errBorder = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: AppColor.hB8B8B8));
  // focusErr textformfield
  static final focusErrBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: AppColor.h44A1FF));

  static const  styleMenu = TextStyle(
      color: AppColor.h94A3B8,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: AppConstants.openSanFont);

  static const textStyleMenu = TextStyle(
      color: AppColor.h64748B,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: AppConstants.openSanFont);

  static borderSize(BuildContext context) => BorderSide(color: Theme.of(context).dividerColor,width: 0.7);
}

