import 'dart:async';

import 'package:ecommerce_app/data/model/view_cart_model.dart';
import 'package:ecommerce_app/screens/dashboard/bottom_nav_provider.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/bloc/cart_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/bloc/cart_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/bloc/cart_state.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/create_order_bloc/create_order_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/create_order_bloc/create_order_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/create_order_bloc/create_order_state.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/delete_cart_bloc/product_remove_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/delete_cart_bloc/product_remove_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/delete_cart_bloc/product_remove_state.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class MyCartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyCartState();
  }

}

class MyCartState extends State<StatefulWidget> {
  int count = 1;
  num totalAmt = 0;
  num discountAmt = 0;
  num discountPer = 0.1;
  num finalAmt = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(getCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme
        .of(context)
        .brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : GrayClr(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("My Cart", style: mytext20(myFontweight: FontWeight.w900,
            mycolor: isDark ? WhiteClr() : BlackClr()),),
        centerTitle: true,
        leading: Container(
            margin: EdgeInsets.only(top: 10),
            child: InkWell(
                onTap: () {
                  context.read<BottomNavProvider>().UpdateIndex(2);
                },
                child: CircleBtn(
                  myicon: Icons.arrow_back_ios_new_rounded, iconsize: 28.00,))),
        leadingWidth: 80,

      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
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
          if (state is CartErrorState) {
            return Center(child: SizedBox(
                width: 250,
                height: 250,
                child:Lottie.asset("assets/lottie/network_problem.json",fit: BoxFit.cover)));
          }
          if (state is CartLoadedState) {
            getBillReady(state.mData.data!);
            return state.mData.data!.isNotEmpty ? Column(
              children: [
                ///Product items list...
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: state.mData.data!.length,
                      itemBuilder: (_, index) {
                        var eachDetails = state.mData.data![index];
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 110,
                          decoration: BoxDecoration(
                              color: isDark ? Colors.grey.shade900 : Colors
                                  .white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [

                                    ///Product Images...
                                    Container(
                                      width: 95,
                                      height: 95,
                                      decoration: BoxDecoration(
                                          color: isDark
                                              ? Colors.grey.shade500
                                              : GrayClr(),
                                          borderRadius: BorderRadius.circular(
                                              20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                eachDetails.image!),
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
                                            Text(eachDetails.name!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "pop",
                                                  color: isDark ? WhiteClr() : BlackClr()),),
                                            SizedBox(height: 5,),

                                            ///Product Type...
                                            //Text(AppConstData.productdata[index]["type"],style: TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: "pop"),),
                                            SizedBox(height: 5,),

                                            ///Product Price...
                                            Text("\$${eachDetails.price}",
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

                              ///Delete Icons,and Add Item Count...
                              Positioned(
                                right: 10,
                                top: 4,
                                child: BlocListener<ProductRemoveBloc,ProductRemoveState>(
                                  listener: (context, state) {
                                    if(state is ProductRemoveLoadingState){
                                      isLoading=true;
                                      setState(() {});
                                    }
                                    if(state is ProductRemoveSuccessState){
                                      isLoading=false;
                                      setState(() {});
                                    }
                                    if(state is ProductRemoveFaliureState){
                                      isLoading=false;
                                      setState(() {});
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                                    }
                                    
                                  },
                                  child: IconButton(onPressed: () {
                                    context.read<ProductRemoveBloc>().add(ProductRemoveE(cart_Id: state.mData.data![index].id!));
                                    setState(() {

                                    });((){});
                                  },
                                      icon: Icon(Icons.delete, size: 28, color: Colors.red,)),
                                  
                                ),
                              ),

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
                                            setState(() {});
                                          },
                                          child: Image.asset(
                                            "assets/icons/minus.png",
                                            width: 25,)),

                                      ///Quantity Count Update..
                                      Text("${eachDetails.quantity}",
                                        style: mytext16(
                                            myFontweight: FontWeight.bold),),

                                      ///Count++..
                                      InkWell(
                                          onTap: () {
                                            count++;
                                            setState(() {});
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

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ///Total bill...
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: isDark ? Colors.grey.shade900 : Colors.white,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(35))
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ///Discount Code..
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: isDark ? WhiteClr() : BlackClr(),
                                    width: 2),
                              ),
                              suffix: Text("Apply", style: mytext16(
                                  mycolor: OrangeClr(),
                                  myFontweight: FontWeight.w700),),
                              hintText: "Enter Discount Code",
                            ),
                          ),
                          SizedBox(height: 10,),

                          ///SubTotal..
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount:-${discountPer * 100}%",
                                style: TextStyle(fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'pop'),),
                              Text("\$${discountAmt}", style: mytext16(
                                  myFontweight: FontWeight.w900,
                                  mycolor: isDark ? WhiteClr() : BlackClr()),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(thickness: 2,),
                          ///Total Amount...
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total", style: TextStyle(fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'pop'),),
                              Text("\$${finalAmt}", style: mytext16(
                                  myFontweight: FontWeight.w900,
                                  mycolor: isDark ? WhiteClr() : BlackClr()),)
                            ],
                          ),
                          SizedBox(height: 20,),
                          ///Checkout Button...
                          BlocListener<CreateOrderBloc,CreateOrderState>(
                            listener: (_,state){
                              if(state is CreateOrderLoadingState){
                                isLoading=true;
                                setState(() {});
                              }
                              if(state is CreateOderSuccessState){
                                isLoading=false;
                                showDialog(context: context, builder: (_){
                                  return Center(
                                    child: Lottie.asset("assets/lottie/succsefuly.json",fit: BoxFit.cover),
                                  );});
                                setState(() {
                                  Timer(Duration(seconds: 2),() {
                                    context.read<BottomNavProvider>().UpdateIndex(2);
                                    Navigator.pop(context);
                                  },);
                                });
                              }
                              if(state is CreateOrderFaliureState){
                                isLoading=true;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                              }
                            },
                            child: InkWell(
                              onTap: (){
                                context.read<CreateOrderBloc>().add(getOrderCreateEvent());
                              },
                              child: RoundedBtn(
                                mainWidget: isLoading?Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(color: WhiteClr(),)),
                                    SizedBox(width: 10,),
                                    Text("Loading...",style: mytext11(mycolor: Colors.white),)
                                  ],
                                ):null,
                                btnname: "Checkout",
                                textsize: 21.00,
                                btnheight: 55.00,
                                btnwidth: double.infinity,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ) : Center(child: Text("Cart is Empty",style: mytext16(mycolor: Colors.white),),);
          }
          return Container();
        },

      ),
    );
  }

  getBillReady(List<CartModel> mItems) {
    totalAmt = 0;

    for (CartModel eachItem in mItems) {
      totalAmt += int.parse(eachItem.price!) * eachItem.quantity!;
      discountAmt = totalAmt * discountPer;

      finalAmt = totalAmt - discountAmt;
    }
  }

}

