import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_constants.dart';
import 'package:flutter_base/generated/l10n.dart';
import 'package:flutter_base/pages/main_page.dart';
import 'package:flutter_base/utils/DatabaseUtils.dart';
import 'package:flutter_base/utils/locator.dart';
import 'package:flutter_base/utils/navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'constants/app_color.dart';
import 'constants/app_dimens.dart';

final globalKeyMain = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await DatabaseUtils.databaseBuilder();
  runApp(THKApp());
}

class THKApp extends StatelessWidget {
  const THKApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MaterialApp(
        key: globalKeyMain,
        locale: const Locale("ev"),
        debugShowCheckedModeBanner: false,
        title: 'APP',
        theme: _themeData,
        home: const MainPage(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }

  ThemeData get _themeData => ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppColor.hFFFFFF,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        displayMedium: TextStyle(
            color: Colors.grey,
            fontSize: AppSP.sp_12,
            fontFamily: AppConstants.fontMulish,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: Colors.grey,
            fontSize: AppSP.sp_14,
            fontFamily: AppConstants.fontMulish,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
          fontSize: AppSP.sp_16,
          fontFamily: AppConstants.fontMulish,
          fontWeight: FontWeight.bold,
          color: AppColor.h00cccc,
          overflow: TextOverflow.ellipsis,
        ),
      ));
}
