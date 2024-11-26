import 'dart:async';

import 'package:ecommerce_app/screens/dashboard/bottom_nav_page.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/home_page.dart';
import 'package:ecommerce_app/screens/login/login_page.dart';
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return SplashPageState();
  }

}

class SplashPageState extends State<SplashPage>{

  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()async{
      SharedPreferences pref =await SharedPreferences.getInstance();
      String uid = pref.getString(AppConstData.PREF_UID)??"";
      Widget navTo=LoginPage();
      if(uid.isNotEmpty){
        navTo=BottomNavPage();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navTo,));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/shopping.json"),
            Text("Shopping",style: mytext20(myFontweight: FontWeight.w900),)
          ],
        ),
      ),
    );
  }

}