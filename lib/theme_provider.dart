import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark=false;

  Future<void> getPrefThemeValue() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    _isDark=pref.getBool("themeKey")??false;
    notifyListeners();
  }

  void getPrefValue() => _isDark;

  void changeThemeValue(bool newValue)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("themeKey",newValue);
    _isDark=newValue;
    notifyListeners();
  }

   getThemeValue()=>_isDark;
}