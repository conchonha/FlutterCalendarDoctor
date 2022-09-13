import 'package:flutter_base/components/app_transparent_button.dart';
import 'package:flutter_base/constants/app_color.dart';
import 'package:flutter_base/constants/app_drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPopup extends StatelessWidget {
  final String? message;
  final String? title;

  ErrorPopup({this.message, this.title});

  static Future show(BuildContext context, {String? message, String? title}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => Dialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: ErrorPopup(message: message, title: title),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColor.hFFFFFF, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppDrawable.iconErr),
            SizedBox(height: 11),
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.hD7443E,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),
            Text(
              message ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.h5E5E5E, fontSize: 14),
            ),
            const SizedBox(height: 25),
            AppTransparentButton(
              text: "close",
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}
