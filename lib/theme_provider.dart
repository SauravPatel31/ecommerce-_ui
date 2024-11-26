import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark=false;

  void getPrefValue()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    _isDark=pref.getBool("themeKey")??false;
    notifyListeners();
  }

  void changeThemeValue(bool newValue)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("themeKey",newValue);
    _isDark=newValue;
    notifyListeners();
  }

   getThemeValue()=>_isDark;
}