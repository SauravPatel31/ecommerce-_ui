import 'package:ecommerce_app/ui_pages/home_page.dart';
import 'package:ecommerce_app/ui_pages/my_cart_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }

}

class BottomState extends State<StatefulWidget>{
  int selectindex=2;
  List<Widget> navigetTo=[
    Center(child: Text("Product Category",style: mytext20(),)),
    Center(child: Text("Favorite Products",style: mytext20(),)),
    HomePage(),
    MyCartPage(),
    Center(child: Text("Profiles",style: mytext20(),)),

  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: navigetTo[selectindex],
     bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.category_outlined,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.person,),label: ""),
         ],
       currentIndex: selectindex,
       onTap: (value){
         selectindex=value;
         setState(() {

         });
       },

       selectedItemColor: OrangeClr(),
       unselectedItemColor: Colors.grey,
       backgroundColor: WhiteClr(),
       iconSize: 30,
       selectedFontSize: 20,


     ),
   );
  }

}