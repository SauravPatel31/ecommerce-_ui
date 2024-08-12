
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleBtn extends StatelessWidget{
  var mycolor;
  var iconcolor;
  var myicon;
  final iconsize;
  var circleradius;
  CircleBtn({ required this.myicon,this.mycolor,this.iconcolor,this.iconsize,this.circleradius});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: circleradius??27,
      backgroundColor: mycolor??WhiteClr(),
      child: Icon(myicon,size: iconsize??30,color: iconcolor??BlackClr(),),
    );
  }

}

class RoundedBtn extends StatelessWidget{
  var btncolor;
  var btnname;
  var btnwidth;
  var btnheight;
  var textsize;
  var textcolor;



  RoundedBtn({required this.btnname,this.btncolor,this.btnwidth,this.btnheight,this.textsize,this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnwidth??200,
      height: btnheight??40,
      decoration: BoxDecoration(
        color: btncolor??OrangeClr(),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text(btnname,style: TextStyle(fontSize:textsize??15,color: textcolor??WhiteClr(),fontWeight: FontWeight.w400 ),)),
    );
  }

}

class ProductInfo extends StatelessWidget{
  var product_img;
  var product_name;
  var product_price;
  var choesColors;

  ProductInfo({required this.product_img,required this.product_name,required this.product_price,this.choesColors});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: GrayClr(),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Stack(
        children: [
          ///Favorite Icons...
          Positioned(
            right: 0,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: OrangeClr(),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(12))
              ),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_sharp,size: 30,color: Colors.white)),
            ),
          ),
          ///Products Details..
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Products Images..
                Image.asset(product_img,width: 85,),
                ///Product Name..
                Text("$product_name",textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                ///Price...
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("\$${product_price}.00",style: TextStyle(fontSize: 14),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration:BoxDecoration(
                            color:Colors.black,
                            border: Border.all(
                              width: 3,
                              color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(12)
                          ) ,
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 20,
                          height: 20,
                          decoration:BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)
                          ) ,
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 20,
                          height: 20,
                          decoration:BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)
                          ) ,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

}