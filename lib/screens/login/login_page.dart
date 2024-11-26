import 'package:ecommerce_app/screens/dashboard/bottom_nav_page.dart';
import 'package:ecommerce_app/screens/login/bloc/login_bloc.dart';
import 'package:ecommerce_app/screens/login/bloc/login_event.dart';
import 'package:ecommerce_app/screens/login/bloc/login_state.dart';
import 'package:ecommerce_app/screens/signup/signup_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/styling_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =TextEditingController();

  TextEditingController passController =TextEditingController();

  bool isLoading=false;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pattern=r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp =RegExp(pattern);
    return Form(
      key: formKey,
      child: Scaffold(
       body: Center(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Welcome Back !!",style: mytext22(myFontweight: FontWeight.w900,mycolor: OrangeClr()),),
                SizedBox(height: 11,),
                MyTextField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "Enter the email";
                    }
                    else if(!regExp.hasMatch(value)){
                      return "Enter the valid email";
                    }

                  },
                  textEditingController: emailController, hintText: "Enter the email", mySuficsIcon:Icons.email,keyBoardType: TextInputType.emailAddress,),
                SizedBox(height: 11,),
                MyTextField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "Enter the password";
                    }
                  },
                  textEditingController: passController, hintText: "Enter the password", mySuficsIcon: Icons.lock,isVisible: false,isPasswordField: true,),
               SizedBox(height: 11,),
               ///Login Btn..
               BlocListener<LoginBloc,LoginState>(
                 listener: (context, state) {
                   if(state is LoginLoadingState){
                     isLoading=true;
                     setState(() {});
                   }
                   if(state is LoginSuccessState){
                     isLoading=false;
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavPage(),));
                   }
                   if(state is LoginFaliureState){
                     isLoading =false;
                     setState(() {});
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                   }
                   },
                 child: InkWell(
                     onTap: (){
                       if(formKey.currentState!.validate()){
                         context.read<LoginBloc>().add(LoginUser(email: emailController.text.trim(), password: passController.text.trim()));
                       }
                       },
                     child: RoundedBtn(btnname: "Login",mainWidget: isLoading?Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(
                             width: 15,
                             height: 15,
                             child: CircularProgressIndicator(color: Colors.white,)),
                         SizedBox(width: 10,),
                         Text("Loading...",style: mytext11(mycolor: Colors.white),)
                       ],
                     ):null,)),
               ),
               SizedBox(height: 16,),
               ///Don't have an account SignUp Btn..
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Dont have an Account?"),
                   TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                   }, child: Text("SignUp",style: TextStyle(color: OrangeClr()),))
                 ],
               )

             ],
           ),
         ),
       ),
      ),
    );
  }
}