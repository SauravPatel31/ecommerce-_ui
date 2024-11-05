import 'package:ecommerce_app/screens/bottom_nav_page.dart';
import 'package:ecommerce_app/screens/signup_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Welcome Bake!!"),
            MyTextField(textEditingController: emailController, hintText: "Enter the email", mySuficsIcon:Icons.email),
            SizedBox(height: 11,),
            MyTextField(textEditingController: passController, hintText: "Enter the password", mySuficsIcon:Icons.lock,isVisible: false,),
           SizedBox(height: 11,),
           InkWell(
               onTap: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavPage(),));
                 print("Login");
               },
               child: RoundedBtn(btnname: "Login")),
           SizedBox(height: 16,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Dont have an Account?"),
               TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
               }, child: Text("SignUp"))
             ],
           )

         ],
       ),
     ),
    );
  }

}