import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/screens/dashboard/bottom_nav_provider.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/home_page.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/my_cart_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'nav_pages/category_page.dart';
import 'nav_pages/profile_page/profile_page.dart';

class BottomNavPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }

}

class BottomState extends State<BottomNavPage>{
  List<Widget> navigetTo=[
    CategoryPage(),
    Center(child: Text("Favorite Products",style: mytext20(),)),
    HomePage(),
    MyCartPage(),
    ProfilePage()

  ];
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness==Brightness.dark;
   return Consumer<BottomNavProvider>(
     builder: (ctx,indexValue,child){
       return Scaffold(
         body: navigetTo[indexValue.getBottomPage()],
         bottomNavigationBar: CurvedNavigationBar(
           items: [
             Icon(Icons.category_outlined,size: 33),
             Icon(Icons.favorite_outline_sharp,size: 33),
             Icon(Icons.home_filled,size: 33),
             Icon(Icons.shopping_cart_outlined,size: 33,),
             Icon(Icons.person,size: 33)
           ],
           index: indexValue.getBottomPage(),
           color:isDark?Colors.grey.shade900: Colors.black12,
           backgroundColor:Colors.transparent,
           buttonBackgroundColor: OrangeClr(),
           onTap: (index){
              ctx.read<BottomNavProvider>().UpdateIndex(index);
             // selectindex=index;
           },
         ),
       );
     },

   );
  }

}

/*           BottomNavigationBarItem(icon: Icon(Icons.category_outlined,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.person,),label: ""),*/