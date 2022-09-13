import 'package:flutter_base/services/remote/api.dart';
import 'package:flutter/material.dart';

import '../utils/locator.dart';

abstract class BaseVM extends ChangeNotifier {
  final api = locator<API>();
  final prefs = locator<SharedPrefs>();
  bool isShowLoading = false;
  VoidCallback? onLoading;
  VoidCallback? onHideLoading;
  void Function(String)? onError;

  @protected
  void onInit();

  @protected
  void viewAppear();

  @protected
  void viewDisAppear();

  void popupLoading() {
    isShowLoading = true;
    onLoading?.call();
  }

  void hideLoading() {
    if (isShowLoading) {
      isShowLoading = false;
      onHideLoading?.call();
    }
  }

  void showError(String message) {
    onError?.call(message);
  }

  void showHandleFailed() {
    onError?.call("Xử lý thất bại. Vui lòng thử lại");
  }
}
