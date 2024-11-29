import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/product_details_page.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/cat_bloc/category_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/cat_bloc/category_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/cat_bloc/category_state.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/product_bloc/product_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/product_bloc/product_state.dart';
import 'package:ecommerce_app/screens/login/login_page.dart';
import 'package:ecommerce_app/theme_provider.dart';

import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> sliderItems=[
    Stack(
      children: [
        ///image..
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage("assets/images/shoesimg/shoimg.jpeg"),fit: BoxFit.cover)
          ),
        ),

        ///Discount Text..
        Positioned(
          top: 11,
          left: 15,
          child: Container(
            width: 170,
            child: Text("Super Sale Discount Up to 50%",style: mytext22(myFontweight: FontWeight.w900),),
          ),
        ),
        ///Shop Now Button...
        Positioned(
            bottom: 15,
            left: 25,
            child: RoundedBtn(btnname: "Shope Now",btnwidth: 150.00,))

      ],
    ),
    Stack(
      children: [
        ///image..
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage("assets/images/winterSale.jpg"),fit: BoxFit.cover)
          ),
        ),

        ///Discount Text..
      /*  Positioned(
          top: 11,
          left: 15,
          child: Container(
            width: 170,
            child: Text("Super Sale Discount Up to 50%",style: mytext22(myFontweight: FontWeight.w900),),
          ),
        ),*/
        ///Shop Now Button...
        Positioned(
            bottom: 15,
            left: 25,
            child: RoundedBtn(btnname: "Shope Now",btnwidth: 150.00,))

      ],
    ),
    Stack(
      children: [
        ///image..
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage("assets/images/phonesale.jpg"),fit: BoxFit.cover)
          ),
        ),

        ///Discount Text..
       /* Positioned(
          top: 11,
          left: 15,
          child: Container(
            width: 170,
            child: Text("Super Sale Discount Up to 50%",style: mytext22(myFontweight: FontWeight.w900),),
          ),
        ),*/
        ///Shop Now Button...
        Positioned(
            bottom: 15,
            left: 25,
            child: RoundedBtn(btnname: "Shope Now",btnwidth: 150.00,))

      ],
    ),
    Stack(
      children: [
        ///image..
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage("assets/images/supersale.jpg"),fit: BoxFit.cover)
          ),
        ),
        ///Discount Text..
       /* Positioned(
          top: 11,
          left: 15,
          child: Container(
            width: 170,
            child: Text("Super Sale Discount Up to 50%",style: mytext22(myFontweight: FontWeight.w900),),
          ),
        ),*/
        ///Shop Now Button...
        Positioned(
            bottom: 15,
            left: 25,
            child: RoundedBtn(btnname: "Shope Now",btnwidth: 150.00,))

      ],
    ),
  ];
  int currentIndecatorPosition=0;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness==Brightness.dark;
    context.read<ProductBloc>().add(getProductEvent());
    context.read<CategoryBloc>().add(GetCategoryEvent());
    return Scaffold(
      appBar: AppBar(
        // leading: Container(
        //   margin: EdgeInsets.only(left: 10),
        //   child: CircleAvatar(
        //       maxRadius: 30,
        //       backgroundColor:isDark?BlackClr(): GrayClr(),
        //       child: Image.asset("assets/icons/dotted-line.png",width: 35,)),
        // ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleBtn(myicon: Icons.notifications_outlined,mycolor: GrayClr(),)),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ///Search Bar..
              TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: isDark?WhiteClr():BlackClr(),width: 2)
                  ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: isDark?WhiteClr():BlackClr(),width: 2)
                ),
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.filter_list),)
              ),
            ),
              SizedBox(height: 15,),
              ///Image Slider...
              StatefulBuilder(builder: (context,ss){
                return Column(
                  children: [
                    ///Image Slider...
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child:CarouselSlider(
                        items: sliderItems,
                        options: CarouselOptions(
                          onPageChanged: (index,reason){
                            currentIndecatorPosition=index;
                            ss((){});
                            },
                          aspectRatio: 16/9,
                          viewportFraction: 1,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,

                        ),
                      ) ,
                    ),
                    SizedBox(height: 8,),
                    ///Indicator...
                    DotsIndicator(dotsCount: sliderItems.length,position: currentIndecatorPosition,
                      decorator: DotsDecorator(
                      activeColor:OrangeClr(),
                          size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),)
                  ],
                );
              }),
              SizedBox(height: 10,),
              ///Category List...
              BlocBuilder<CategoryBloc,CategoryState>(builder: (_,state){
                if(state is CategoryLoadingState){
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 25,
                        itemBuilder: (_,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer.fromColors(
                              baseColor: isDark?Colors.grey.shade800: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: CircleAvatar(
                                maxRadius: 35,
                              ),
                            ),
                          );
                    }),
                  );
                }
                if(state is CategoryErrorState){
                  return Center(child: Text("No Internet Connection !!",style: mytext20(mycolor: isDark?WhiteClr():BlackClr()),),);
                 /// ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                }
                if(state is CategoryLoadedState){
                  return state.mData.data!.isNotEmpty?Container(
                    height: 150,
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ///Category Image
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage(AppConstData.categorydata[index]["categoryimg"]),
                              maxRadius: 35,
                            ),
                            SizedBox(height: 10,),
                            ///Category Name..
                            Container(
                                width:70,
                                child: Text(state.mData.data![index].name!,textAlign: TextAlign.center,style: mytext11(myFontweight: FontWeight.w700,mycolor: isDark?WhiteClr():BlackClr()),))
                          ],
                        ),
                      );
                    },
                      itemCount: state.mData.data!.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ):Center(child: Text("No Category Found",style: mytext11(),),);
                }
                return Container();
              }),
              ///Text Special For you and See all...
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special For You",style: mytext16(myFontweight: FontWeight.w900,mycolor: isDark?WhiteClr():BlackClr()),),
                  Text("See all",style: mytext11(mycolor: isDark?WhiteClr():BlackClr()),)
                ],
              ),
              SizedBox(height: 10,),
              ///Special For You GridView...
              BlocBuilder<ProductBloc,ProductState>(builder: (_,state){
                if(state is ProductLoadingState){
                  return SizedBox(
                    height: 500,
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,mainAxisExtent: 200),
                    itemCount: 8,
                      itemBuilder: (_,index){
                      return Shimmer.fromColors(
                        baseColor: isDark?Colors.grey.shade800: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      );
                    },
                    ),
                  );
                }
                if(state is ProductErrorState){
                 return Center(child: SizedBox(
                     width: 250,
                     height: 250,
                     child:Lottie.asset("assets/lottie/network_problem.json",fit: BoxFit.cover)));
                }
                if(state is ProductLoadedState){
                  return state.mData.data!.isNotEmpty? GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,mainAxisExtent: 200),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCartPage( productModel: state.mData.data![index],sindex: index)));
                        },
                        child: Hero(
                          tag: "$index",
                          child: ProductInfo(
                            product_img: NetworkImage(state.mData.data![index].image!),
                            product_name: state.mData.data![index].name,
                            product_price:state.mData.data![index].price ,
                            //choesColors: Color(AppConstData.productdata[index]["pcolor"]),
                          ),
                        ),
                      ) ;
                    },
                    itemCount: state.mData.data!.length,
                  ):Text("No Product Found !!");
                }
                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}

/*
ProductInfo(
product_img: AppConstData.productdata[index]["pimg"],
product_name: AppConstData.productdata[index]["pname"],
product_price: AppConstData.productdata[index]["price"]

)*/
