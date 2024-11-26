import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/bloc/add_to_cart_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/bloc/add_to_cart_state.dart';
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/product_data_model.dart';

class AddToCartPage extends StatefulWidget{
  ProductDataModel productModel;
 int sindex;
 AddToCartPage({required this.productModel,required this.sindex});
  @override
  State<StatefulWidget> createState() {
    return AddToCartState();
  }
}

class AddToCartState extends State<AddToCartPage>{
  int count=1;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      backgroundColor: isDark?Colors.black: GrayClr(),
      appBar: AppBar(
        backgroundColor: isDark?Colors.black: GrayClr(),
        centerTitle: true,
        leading:InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: CircleBtn(myicon: Icons.arrow_back_ios_new,iconsize: 27.00,),) ,
        leadingWidth: 80,
        actions: [
          CircleBtn(myicon: Icons.share),
          SizedBox(width: 30,),
          CircleBtn(myicon: Icons.favorite_outline_sharp),
          SizedBox(width: 10,),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ///Product Images..
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: "${widget.sindex}",
                child: Container(
                    width: 220,
                     height: 250,
                    // color: Colors.red,
                     //color: Colors.red,
                    child: Image.network(widget.productModel.image!,width: 210,)),
              ),
            ),
            ///Product Information such like name,price,rating etc...
            Positioned(
              bottom: 0,
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width/1,
                decoration: BoxDecoration(
                  //color: WhiteClr(),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        ///Product Name Text..
                        Text("${widget.productModel.name}",style: mytext22(myFontweight: FontWeight.bold,mycolor: isDark?WhiteClr():BlackClr()),),
                        SizedBox(height: 5,),
                        ///Price Text...
                        Text("\$${widget.productModel.price}",style: mytext16(myFontweight: FontWeight.bold,mycolor: isDark?WhiteClr():BlackClr()),),
                        SizedBox(height: 10,),
                        ///Rating and Reviews..
                        Row(
                          children: [
                            ///Rating...
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:OrangeClr(),
                              ),
                              width: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.star,size: 20,),
                                  Text("4.8",style: TextStyle(color: WhiteClr()),),

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            ///Reviews...
                            Row(
                              children: [
                                Text("${widget.productModel.updated_at} Update",style: mytext11(mycolor: isDark?WhiteClr():BlackClr()),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        ///Select Colors...
                        Text("Color",style: mytext16(myFontweight: FontWeight.bold,mycolor: isDark?WhiteClr():BlackClr()),),
                        SizedBox(height: 10,),
                        ///Colors..
                        Container(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xff901E30),
                                  borderRadius: BorderRadius.circular(15)
                                ),

                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 4,color: Colors.grey.shade500),
                                    color: Color(0xff000000),
                                  borderRadius: BorderRadius.circular(15)
                                ),

                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xff1C4491),
                                  borderRadius: BorderRadius.circular(15)
                                ),

                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xff90471D),
                                  borderRadius: BorderRadius.circular(15)
                                ),

                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffD8D6D7),
                                  borderRadius: BorderRadius.circular(15)
                                ),

                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ///Tab Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundedBtn(btnname: "Description",btnwidth: 110.00,btnheight: 35.00,textsize: 11.00),
                            RoundedBtn(btnname: "Specification",btnwidth: 110.00,btnheight: 35.00,textsize: 11.00,btncolor: Colors.transparent,textcolor:isDark?WhiteClr():BlackClr(),),
                            RoundedBtn(btnname: "Reviews",btnwidth: 110.00,btnheight: 35.00,textsize: 11.00,btncolor: Colors.transparent,textcolor: isDark?WhiteClr():BlackClr()),
                          ],

                        ),
                        Text("In a land where the sun never set, the trees whispered secrets of ancient times,"
                            "and the rivers flowed with tales of forgotten dreams.The mountains stood tall,guardians"
                            " of mysteries known only to the wind.In the heart of the forest,a single flower bloomed,"
                            "its petals shimmering like stars in the twilight"
                            "In a land where the sun never set, the trees whispered secrets of ancient times,"
                            "and the rivers flowed with tales of forgotten dreams.The mountains stood tall,guardians"
                            " of mysteries known only to the wind.In the heart of the forest,a single flower bloomed,"
                            "its petals shimmering like stars in the twilight"
                            "Travelers who ventured too close would hear the melody of the earth, a song that echoed in their souls long after they had left.",
                          textAlign: TextAlign.justify,style: TextStyle(fontSize: 14,color: Colors.grey),)
                      ],
                    ),
                  ),
                ),

              ),
            ),
            ///Add to Cart Button...
            Positioned(
              bottom: 05,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff000000),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  width: MediaQuery.of(context).size.width/1.1,
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///Count Button...
                      Container(
                        width: 130,
                        height: 45,
                        decoration: BoxDecoration(
                            //color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 2
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                               onTap:(){
                                 if(count>1){
                                   count--;
                                 }
                                 setState(() {

                                 });
                               },
                                child: Text("-",style: mytext22(mycolor: Colors.white,myFontweight: FontWeight.w900),)

                            ),
                            Text("$count",style: mytext20(mycolor: Colors.white,myFontweight: FontWeight.w600),),
                            InkWell(
                                onTap: (){
                                  count++;
                                  setState(() {

                                  });
                                },
                                child: Text("+",style: mytext20(myFontweight: FontWeight.w900,mycolor: Colors.white),))
                          ],
                        ),
                      ),
                      ///Add to Cart Button..

                      BlocListener<AddToCartBloc,AddToCartsState>(
                        listener: (_,state){
                          if(state is AddToCartLoadingState){
                            isLoading=true;
                            setState(() {});
                          }
                          if(state is AddToCartSuccessState){
                            isLoading=false;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Add Sucssfully In Cart"),));
                            Navigator.pop(context);
                          }
                          if(state is AddToCartFaliureState){
                            isLoading=false;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                          }
                        },
                        child: InkWell(
                            onTap: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartPage(),));
                              context.read<AddToCartBloc>().add(ProductAddToCartEvent( productId: int.parse(widget.productModel.id!), quantity: count));
                              var ItemsAmt= count*double.parse(widget.productModel.price!);
                              print(ItemsAmt);
                              print("Add to Cart");
                            },
                            child: RoundedBtn(
                              btnname: "Add to Cart",
                              btnwidth: 200.00,
                              btnheight: 50.00,
                              textsize: 18.00,
                              mainWidget: isLoading?Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(color: Colors.white,)),
                                  SizedBox(width: 15,),
                                  Text("Adding...",style: TextStyle(color: Colors.white),)
                                ],
                              ):null,

                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}