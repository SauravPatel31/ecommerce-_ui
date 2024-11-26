import 'package:ecommerce_app/screens/signup/bloc/signup_bloc.dart';
import 'package:ecommerce_app/screens/signup/bloc/signup_event.dart';
import 'package:ecommerce_app/screens/signup/bloc/signup_state.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/custom_widget_page.dart';

class SignupPage extends StatefulWidget{
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController =TextEditingController();

  TextEditingController mobNoController =TextEditingController();

  TextEditingController emailController =TextEditingController();

  TextEditingController passController =TextEditingController();

  bool isLoading=false;

  GlobalKey<FormState> formkey=GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    var patternEmail=r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExpEmail =RegExp(patternEmail);

    var patternPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExpPhone = RegExp(patternPhone);
   return Scaffold(
     body:Form(
       key: formkey,
       child: Center(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Create Your Account",style: mytext22(myFontweight: FontWeight.w900,mycolor: OrangeClr()),),
               const SizedBox(height: 11,),
               MyTextField(
                 validator: (value){
                   if(value==null ||value.isEmpty){
                     return "Please Enter the name";
                   }
                 },
                 textEditingController: nameController, hintText: "Enter the name", mySuficsIcon: Icons.text_fields,keyBoardType: TextInputType.text,),
               const SizedBox(height: 11,),
               MyTextField(
                 validator: (value){
                   if(value==null||value.isEmpty){
                     return "Please Enter the mobile number";
                   }else if(!regExpPhone.hasMatch(value)){
                     return "Please Enter the valid mobile number";
                   }
                 },
                 textEditingController: mobNoController, hintText: "Enter the mobile number", mySuficsIcon: Icons.call,keyBoardType: TextInputType.phone,),
               const SizedBox(height: 11,),
               MyTextField(
                 validator: (value){
                   if(value==null||value.isEmpty){
                     return "Please Enter the email";
                   }else if(!regExpEmail.hasMatch(value)){
                     return "Please Enter the valid email";
                   }
                 },
                 textEditingController: emailController, hintText: "Enter the email", mySuficsIcon:Icons.email,keyBoardType: TextInputType.emailAddress,),
               const SizedBox(height: 11,),
               MyTextField(
                 validator: (value){
                   if(value==null||value.isEmpty){
                     return "Please Enter the password";
                   }
                 },
                 textEditingController: passController, hintText: "Enter the password", mySuficsIcon:Icons.lock,isVisible: false,isPasswordField: true,),
               const SizedBox(height: 11,),
               ///SignUp Btn..
               BlocListener<SignupBloc,SignupState>(
                 listener: (context, state) {
                   if(state is SignupLoadingState){
                     isLoading=true;
                     setState(() {});
                   }
                   if(state is SignupSuccessState){
                     isLoading=false;
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Account Created Successfully")));
                     Navigator.pop(context);
                   }
                   if(state is SignupFaliureState){
                     isLoading =false;
                     setState(() {});
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                   }


                 },
                 child: InkWell(
                     onTap: (){
                       var name=nameController.text.trim();
                       var email=emailController.text.trim();
                       var mobNo=mobNoController.text.trim();
                       var pass=passController.text.trim();
                       if(formkey.currentState!.validate()){
                         context.read<SignupBloc>().add(SignupUser(email: email, password: pass, name: name, mobile: mobNo));
                       }
                       },
                     child: RoundedBtn(btnname: "SignUp",mainWidget: isLoading?
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const SizedBox(
                             width: 15,
                             height: 15,
                             child: CircularProgressIndicator(color: Colors.white,)),
                       const SizedBox(width: 10,),
                       Text("Loading...",style: mytext11(mycolor: Colors.white),)
                     ],):null,)),
               ),
               const SizedBox(height: 16,),
               ///Login Btn..
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text("Already have an Account?"),
                   TextButton(onPressed: (){
                     Navigator.pop(context);
                   }, child: Text("Login",style: TextStyle(color: OrangeClr()),))
                 ],
               )

             ],
           ),
         ),
       ),
     )
   );
  }
}