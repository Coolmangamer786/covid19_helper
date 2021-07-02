import 'package:covid19_helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
backgroundColor: Colors.white,
accentColor: kPinkCont,
primaryColor: kPinkCont,
primaryColorDark: Colors.black,
    primaryColorLight: kPinkCont,
    scaffoldBackgroundColor: kSomewhatWhite,
    );

ThemeData dark = ThemeData(
  primaryColor: Colors.indigo,
  brightness: Brightness.dark,
  accentColor: KTealLight,
backgroundColor:Colors.black,
primaryColorDark: Colors.white,
  primaryColorLight: kBlackBack,
  scaffoldBackgroundColor: kBlackBack
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences _pref;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}


