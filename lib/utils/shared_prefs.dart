import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  SharedPreferences? _prefs;

  Future initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

}
