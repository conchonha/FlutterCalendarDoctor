import 'package:flutter_base/constants/app_style.dart';
import 'package:flutter_base/utils/snackbar_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';


class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void showNetwork() {
    SnackBarBuilder.snackBarNotification(navigatorKey.currentState!.context,
        "インターネットが接続されていません。\n確認してください。", Colors.red, Colors.white);
  }

  Future<bool> showMyDialog() async {
    Widget okButton = ElevatedButton(
      child: const Text('ログイン'),
      onPressed: () async {},
    );
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(
        '',
        style: AppStyle.textStyleAppBar,
      ),
      content: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 0),
        width: MediaQuery.of(navigatorKey.currentState!.overlay!.context)
            .size
            .width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/ic_rewind_time.svg",
              width: 65,
            ),
            const SizedBox(height: 15),
            Text(
              'ログインの有効期限が切れました。\n 再度ログインしてください。',
              style: AppStyle.textStyleAppBar,
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      actions: [okButton],
    );
    bool result = await showCupertinoDialog(
        context: navigatorKey.currentState!.overlay!.context,
        builder: (_) => alert);
    return result;
  }
}
