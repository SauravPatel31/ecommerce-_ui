
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Text Styling...

TextStyle mytext11({FontWeight myFontweight = FontWeight.normal,Color?mycolor}){
  return TextStyle(
      fontSize: 11,
      color: mycolor??BlackClr(),
      fontWeight: myFontweight,
      fontFamily: "pop"


  );
}
TextStyle mytext13({FontWeight myFontweight = FontWeight.normal,Color?mycolor}){
  return TextStyle(
      fontSize: 13,
      color: mycolor??BlackClr(),
      fontWeight: myFontweight,
      fontFamily: "pop"


  );
}

TextStyle mytext16({FontWeight myFontweight = FontWeight.normal,Color?mycolor}){
  return TextStyle(
    fontSize: 16,
    color: mycolor??BlackClr(),
    fontWeight: myFontweight,
    fontFamily: "pop"


  );
}
TextStyle mytext20({FontWeight myFontweight = FontWeight.normal,Color?mycolor}){
  return TextStyle(
    fontSize: 20,
    color: mycolor??BlackClr(),
    fontWeight: myFontweight,
      fontFamily: "pop"


  );
}
TextStyle mytext22({FontWeight myFontweight = FontWeight.normal,Color?mycolor}){
  return TextStyle(
    fontSize: 22,
    color: mycolor??BlackClr(),
    fontWeight: myFontweight,
      fontFamily: "pop"


  );
}

///App Colors..

Color OrangeClr(){
  return Color(0xffFF660E);
}
Color BlackClr(){
  return Color(0xff202020);
}
Color GrayClr(){
  return Color(0xffE3E3E3);
}
Color WhiteClr(){
  return Color(0xffffffff);
}



