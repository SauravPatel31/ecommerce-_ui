import 'dart:async';

import 'package:ecommerce_app/screens/login_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
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