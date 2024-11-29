
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_state.dart';

import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/styling_page.dart';

class PlaceOdersPage extends StatelessWidget{
  int count=1;
  @override
  Widget build(BuildContext context) {
    bool isDark= Theme.of(context).brightness==Brightness.dark;
   return Scaffold(
     appBar: AppBar(
       title: Text("Place Oders"),
       centerTitle: true,
     ),
     body: BlocBuilder<PlaceOderBloc,PlaceOderState>(builder: (_,state){
       if(state is PlaceOderLoadingState){
         return SizedBox(
           height: 800,
           child: ListView.builder(
               itemCount: 25,
               itemBuilder: (_, index) {
                 return Container(
                   width: double.infinity,
                   height: 110,
                   margin: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     color: isDark ? Colors.grey.shade900 : WhiteClr(),
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     children: [
                       Shimmer.fromColors(
                         baseColor: isDark ? Colors.grey.shade800 : Colors
                             .grey.shade300,
                         highlightColor: Colors.grey.shade100,
                         child: Container(
                           margin: EdgeInsets.all(10),
                           height: 110,
                           width: 110,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                         ),

                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Shimmer.fromColors(
                             baseColor: isDark
                                 ? Colors.grey.shade800
                                 : Colors.grey.shade300,
                             highlightColor: Colors.grey.shade100,
                             child: Text("Product Name...",
                               style: TextStyle(fontSize: 19),),

                           ),
                           Shimmer.fromColors(
                             baseColor: isDark
                                 ? Colors.grey.shade800
                                 : Colors.grey.shade300,
                             highlightColor: Colors.grey.shade100,
                             child: Text("Product Price...."),

                           ),
                         ],
                       )
                     ],
                   ),
                 );
               }),
         );
       }
       if(state is PlaceOderErrorState){
         return Center(child:Text(state.errorMessage),);
       }
       if(state is PlaceOderLoadedState){
         return state.mData.orders!.isNotEmpty?ListView.builder(
           itemCount: state.mData.orders!.length,
           itemBuilder: (_, index) {
             // var eachDetails = state.mData.orders![index].product;
             return Container(
               margin: EdgeInsets.all(10),
               height: 140,
               decoration: BoxDecoration(
                   color: isDark ? Colors.grey.shade900 : Colors.white,
                   borderRadius: BorderRadius.circular(20)
               ),
               child: Stack(
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 8),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         ///Product Images...
                         Container(
                           width: 95,
                           height: 95,
                           decoration: BoxDecoration(
                               color: isDark ? Colors.grey.shade500 : GrayClr(),
                               borderRadius: BorderRadius.circular(
                                   20),
                               image: DecorationImage(
                                 image: NetworkImage(state.mData.orders![index].product![0].image!),
                                 fit: BoxFit.contain,)
                           ),
                         ),
                         SizedBox(width: 10,),
                         ///Product Name,Price...
                         Expanded(
                           child: Container(
                             // color: Colors.red,
                             child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 ///Product Name...
                                 Text("${state.mData.orders![index].product![0].name}",
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "pop",
                                       color: isDark ? WhiteClr() : BlackClr()),),
                                 SizedBox(height: 5,),
                                 Text("\$${state.mData.orders![index].product![0].price}/per",
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "pop",
                                       color: isDark ? WhiteClr() : BlackClr()),),
                                 SizedBox(height:5 ,),
                                 Text("Total Amount",style: mytext11(mycolor: isDark?WhiteClr():BlackClr()),),
                                 Text("\$${state.mData.orders![index].totalAmount}",
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontFamily: "pop",
                                       color: isDark ? WhiteClr() : BlackClr()),),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),

                   Positioned(
                       right: 8,
                       top: 15,
                       child: RoundedBtn(btnname: "Repeat Oder",btnwidth: 140.00,)),
                   ///Add Items Count++,-- ..
                   Positioned(
                     bottom: 15,
                     right: 15,
                     child: Container(
                       width: 110,
                       height: 38,
                       decoration: BoxDecoration(
                           color: isDark
                               ? Colors.grey.shade500
                               : GrayClr(),
                           borderRadius: BorderRadius.circular(20),
                           border: Border.all(color: Colors.grey)
                       ),
                       child: Row(
                         children: [
                           ///Count-- ...
                           InkWell(
                               onTap: () {
                                 if (count > 1) {
                                   count--;
                                 }

                               },
                               child: Image.asset(
                                 "assets/icons/minus.png",
                                 width: 25,)),
                           ///Quantity Count Update..
                           Text("${state.mData.orders![index].product![0].quantity}",
                             style: mytext16(
                                 myFontweight: FontWeight.bold),),
                           ///Count++..
                           InkWell(
                               onTap: () {
                                 count++;
                               },
                               child: Image.asset(
                                 "assets/icons/add.png", width: 25,))
                         ],
                         mainAxisAlignment: MainAxisAlignment
                             .spaceAround,
                       ),
                     ),
                   ),
                 ],
               ),
             );
           },

         ):Center(child: Text("No Oders Founds!!"),);
       }

       return Container();
     }),
   );
  }

}