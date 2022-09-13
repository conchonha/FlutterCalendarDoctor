import 'package:flutter_base/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPopup extends StatelessWidget {
  LoadingPopup();

  static Future show(BuildContext context, {String? message, String? title}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Dialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: LoadingPopup(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColor.hFFFFFF, borderRadius: BorderRadius.circular(10)),
        child: const SpinKitFadingCircle(
          color: AppColor.h1885FF,
        ));
  }
}
