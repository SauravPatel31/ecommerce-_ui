
import 'package:ecommerce_app/ui_pages/bottom_nav_page.dart';
import 'package:ecommerce_app/ui_pages/home_page.dart';
import 'package:ecommerce_app/ui_pages/my_cart_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BottomNavPage(),
    );
  }

}




