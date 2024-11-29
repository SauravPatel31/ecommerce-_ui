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
           child: SingleChildScrollView(
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
                       child: RoundedBtn(btnwidth: MediaQuery.of(context).size.width,btnname: "Login",mainWidget: isLoading?Row(
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
                 ///Facebook,Google,Apple with Login...
                 SizedBox(
                   width: MediaQuery.of(context).size.width/2,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       ///Facebook Login...
                       InkWell(
                         onTap:(){
                           print("With Facebook Login");
                         },
                         child: Container(
                           width: 50,
                           height: 50,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(
                                 color: OrangeClr(),
                                 width: 2
                             ),
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(2.0),
                             child: Image.asset("assets/icons/facebook.png"),
                           ),
                         ),
                       ),
                       ///Google Login...
                       InkWell(
                         onTap: (){
                           print("With Google Login");
                         },
                         child: Container(
                           width: 50,
                           height: 50,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(
                                 color: OrangeClr(),
                                 width: 2
                             ),
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(3.0),
                             child: Image.asset("assets/icons/google.png"),
                           ),
                         ),
                       ),
                       ///Apple...
                       InkWell(
                         onTap: (){
                           print("With Apple Login");
                         },
                         child: Container(
                           width: 50,
                           height: 50,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(
                                 color: OrangeClr(),
                                 width: 2
                             ),
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(2.0),
                             child: Image.asset("assets/icons/apple-logo.png",fit: BoxFit.cover,),
                           ),
                         ),
                       ),
                     ],
                   ),
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
      ),
    );
  }
}