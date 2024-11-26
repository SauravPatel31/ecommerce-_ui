
import 'package:flutter/widgets.dart';

class BottomNavProvider extends ChangeNotifier{
  int _selectedIndex = 2;

  void UpdateIndex(int index){
    _selectedIndex=index;
    notifyListeners();
  }

  int getBottomPage()=>_selectedIndex;
}