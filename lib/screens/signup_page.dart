import 'package:flutter/material.dart';

import '../utils/custom_widget_page.dart';

class SignupPage extends StatelessWidget{
  TextEditingController nameController =TextEditingController();
  TextEditingController mobNoController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Create your account"),
           MyTextField(textEditingController: nameController, hintText: "Enter the name", mySuficsIcon: Icons.text_fields,keyBoardType: TextInputType.text,),
           MyTextField(textEditingController: mobNoController, hintText: "Enter the mobile number", mySuficsIcon: Icons.call,keyBoardType: TextInputType.phone,),
           MyTextField(textEditingController: emailController, hintText: "Enter the email", mySuficsIcon:Icons.email,keyBoardType: TextInputType.emailAddress,),
           SizedBox(height: 11,),
           MyTextField(textEditingController: passController, hintText: "Enter the password", mySuficsIcon:Icons.lock,isVisible: false,),
           SizedBox(height: 11,),
           InkWell(
               onTap: (){
                 print("Login");
               },
               child: RoundedBtn(btnname: "SignUp")),
           SizedBox(height: 16,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Already have an Account?"),
               TextButton(onPressed: (){
                 Navigator.pop(context);
               }, child: Text("Login"))
             ],
           )

         ],
       ),
     )
   );
  }

}