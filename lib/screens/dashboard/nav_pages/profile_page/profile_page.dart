import 'dart:io';

import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/place_oders.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/profile_page/bloc/profile_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/profile_page/bloc/profile_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/profile_page/bloc/profile_state.dart';
import 'package:ecommerce_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/styling_page.dart';
import '../../../login/login_page.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File?profileImg;
  @override
  Widget build(BuildContext context) {
    context.read<PlaceOderBloc>().add(getAllOdersEvent());
    context.read<ProfileBloc>().add(getUserData());
    bool isDark=Theme.of(context).brightness==Brightness.dark;
   return Scaffold(
     backgroundColor: isDark?Colors.black: GrayClr(),
     appBar: AppBar(
       title: Text("Profile"),
       centerTitle: true,

     ),
     body: BlocBuilder<ProfileBloc,ProfileState>(
       builder: (_,state){
         if(state is ProfileLoadingState){
           return Center(child: CircularProgressIndicator(color: OrangeClr(),),);
         }
         if(state is ProfileErrorState){
           return Center(child: SizedBox(
               width: 250,
               height: 250,
               child:Lottie.asset("assets/lottie/network_problem.json",fit: BoxFit.cover)));
         }
         if(state is ProfileLoadedState){
           return Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Container(
                     height: 190,
                     width: MediaQuery.of(context).size.width,
                     //color: Colors.green,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         StatefulBuilder(
                           builder: (_,ss){
                             return InkWell(
                               onTap:()async{
                                 XFile? imgPicked=await  ImagePicker().pickImage(source: ImageSource.gallery);
                                 if(imgPicked!=null){
                                   CroppedFile? imgCropped=await ImageCropper().cropImage(sourcePath: imgPicked.path,
                                       uiSettings: [
                                         AndroidUiSettings(
                                           toolbarTitle: 'Cropper',
                                           toolbarColor: Colors.deepOrange,
                                           toolbarWidgetColor: Colors.white,
                                           aspectRatioPresets: [
                                             CropAspectRatioPreset.original,
                                             CropAspectRatioPreset.square,
                                           ],
                                           initAspectRatio: CropAspectRatioPreset.square,
                                         ),
                                         IOSUiSettings(
                                           title: 'Cropper',
                                           aspectRatioPresets: [
                                             CropAspectRatioPreset.original,
                                             CropAspectRatioPreset.square,
                                             // IMPORTANT: iOS supports only one custom aspect ratio in preset list
                                           ],
                                           minimumAspectRatio: 1,
                                         ),
                                         WebUiSettings(
                                           context: context,
                                           minCropBoxWidth: 350,
                                           size: CropperSize(width: 350, height: 350),
                                           initialAspectRatio: 1/1,
                                           center: true,


                                         )
                                       ]
                                   );
                                   if(imgCropped!=null){
                                     profileImg=File(imgCropped.path);
                                     ss((){});
                                   }
                                 }

                               },
                               child: Container(
                                 height: 120,
                                 width: 120,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: profileImg!=null?FileImage(profileImg!):AssetImage("assets/images/categoryimg/watch.jpeg"),fit: BoxFit.cover),
                                   borderRadius: BorderRadius.circular(60),
                                 ),
                               ),
                             );

                           },

                         ),
                         SizedBox(height: 10,),
                         Text("${state.mData.data!.name}",style: mytext20(myFontweight: FontWeight.w800,mycolor: isDark?WhiteClr():BlackClr()),),
                         SizedBox(height: 10,),

                       ],
                     ),
                   ),
                   ListView(
                     shrinkWrap: true,
                     children: [
                       SizedBox(height: 10,),
                       Text("Personal Information",style: mytext13(myFontweight: FontWeight.w900,mycolor: isDark?WhiteClr():BlackClr()),),
                       InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOdersPage(),));
                           },
                           child: myListTile(icon: Icons.emoji_transportation, title: "Place Oder", isDark: isDark)),
                       myListTile(icon: Icons.email, title: state.mData.data!.email.toString(), isDark: isDark),
                       myListTile(icon: Icons.phone, title: state.mData.data!.mobileNumber.toString(),isDark: isDark),
                       myListTile(icon: Icons.lock, title: state.mData.data!.password.toString(), isDark: isDark),
                       Text("Account Details",style: mytext13(myFontweight: FontWeight.w900,mycolor: isDark?WhiteClr():BlackClr()),),
                       myListTile(icon: Icons.manage_accounts_rounded, title: state.mData.data!.createdAt.toString(), isDark: isDark),
                       myListTile(icon: isDark?Icons.dark_mode:Icons.light_mode, title: "${isDark?"Dark Mode On":"Light Mode On"}", isDark: isDark,trailingWidget: Switch.adaptive(value: context.watch<ThemeProvider>().getThemeValue(), onChanged: (value){
                         context.read<ThemeProvider>().changeThemeValue(value);
                       })),
                       InkWell(
                           onTap: (){
                             showDialog(context: context, builder: (context){
                               return AlertDialog.adaptive(
                                 insetPadding: EdgeInsets.all(25),
                                 elevation: 12,
                                 backgroundColor: isDark?Colors.grey.shade900: Colors.white,
                                 content: Text("Your all preferences will be cleared !!",),
                                 icon: Icon(Icons.logout,size: 30,),
                                   title: Text("Are you sure want to logout ?",style: TextStyle(fontSize: 20),),
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                   actions: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         OutlinedButton(onPressed: ()async{
                                           SharedPreferences pref=await SharedPreferences.getInstance();
                                           await pref.clear();
                                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                                           }, child: Text("YES"),style: OutlinedButton.styleFrom(foregroundColor: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),side: BorderSide(width: 1,color: Colors.red),minimumSize: Size(MediaQuery.of(context).size.width*0.3, 50))),
                                        SizedBox(width: 10,),
                                         OutlinedButton(onPressed: (){
                                           Navigator.pop(context);
                                         }, child: Text("NO"),style: OutlinedButton.styleFrom(foregroundColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),side: BorderSide(width: 1,color: Colors.green),minimumSize: Size(MediaQuery.of(context).size.width*0.3, 50))),
                                       ],
                                     )
                                   ],

                               );
                             });
                           },
                           child: myListTile(icon: Icons.logout, title: "Logout", isDark: isDark))
                     ],
                   )
                 ],
               ),
             ),
           );
         }
         return Container();
       },
     ),
   );
  }

  Widget myListTile({required IconData icon,required String title,Widget? trailingWidget,required bool isDark}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isDark?Colors.grey.shade900: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2
          )
        ]
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: trailingWidget??Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}