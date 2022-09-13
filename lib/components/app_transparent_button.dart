import 'package:flutter_base/constants/app_color.dart';
import 'package:flutter/material.dart';

class AppTransparentButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;

  AppTransparentButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: double.infinity,
    //   child: RaisedButton(
    //     onPressed: onTap,
    //     color: AppColor.hFFFFFF,
    //     disabledColor: AppColor.hFFFFFF,
    //     padding: const EdgeInsets.symmetric(vertical: 10),
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(200),
    //         side: BorderSide(color: AppColor.h44A1FF)),
    //     child: Text(
    //       text ?? '',
    //       style: TextStyle(
    //           color: AppColor.h44A1FF,
    //           fontSize: 14,
    //           fontWeight: FontWeight.w600),
    //     ),
    //   ),
    // );
    return Container();
  }
}
