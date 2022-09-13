import 'package:flutter/material.dart';
import 'package:flutter_base/generated/l10n.dart';
import 'package:flutter_base/pages/main_page.dart';
import 'package:flutter_base/utils/DatabaseUtils.dart';
import 'package:flutter_base/utils/locator.dart';
import 'package:flutter_base/utils/navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

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
        locale: const Locale("ev"),
        debugShowCheckedModeBanner: false,
        title: 'APP',
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
}
