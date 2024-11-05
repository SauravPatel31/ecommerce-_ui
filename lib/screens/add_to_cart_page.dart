
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';

class AddToCartPage extends StatefulWidget{
 int sindex;
 AddToCartPage({required this.sindex});
  @override
  State<StatefulWidget> createState() {
    return AddToCartState(myindex:sindex );
  }
}

class AddToCartState extends State<StatefulWidget>{
  int myindex;
  AddToCartState({required this.myindex});
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrayClr(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                tag: "$myindex",
                child: Container(
                    width: 220,
                     height: 250,
                    // color: Colors.red,
                     //color: Colors.red,
                    child: Image.asset(AppConstData.productdata[myindex]["pimg"],width: 210,)),
              ),
            ),
            ///Product Information such like name,price,rating etc...
            Positioned(
              bottom: 0,
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width/1,
                decoration: BoxDecoration(
                  color: WhiteClr(),
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
                        Text("${AppConstData.productdata[myindex]["pname"]}",style: mytext22(myFontweight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        ///Price Text...
                        Text("\$${AppConstData.productdata[myindex]["price"]}.00",style: mytext16(myFontweight: FontWeight.bold),),
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
                                  Icon(Icons.star,size: 20,color: WhiteClr(),),
                                  Text("4.8",style: TextStyle(color: WhiteClr()),),

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            ///Reviews...
                            Row(
                              children: [
                                Text("${AppConstData.productdata[myindex]["review"]} Review",style: mytext11(mycolor: Colors.grey),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        ///Select Colors...
                        Text("Color",style: mytext16(myFontweight: FontWeight.bold),),
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
                            RoundedBtn(btnname: "Specification",btnwidth: 110.00,btnheight: 35.00,textsize: 11.00,btncolor: Colors.transparent,textcolor: Colors.black,),
                            RoundedBtn(btnname: "Reviews",btnwidth: 110.00,btnheight: 35.00,textsize: 11.00,btncolor: Colors.transparent,textcolor: Colors.black),
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
                      InkWell(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartPage(),));
                            print("Add to Cart");
                          },
                          child: RoundedBtn(btnname: "Add to Cart",btnwidth: 200.00,btnheight: 50.00,textsize: 18.00,))
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