import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyCartState();
  }

}

class MyCartState extends State<StatefulWidget>{
  int count=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GrayClr(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("My Cart",style: mytext20(myFontweight: FontWeight.w900),),
        centerTitle: true,
        leading: Container(
            margin: EdgeInsets.only(top: 10),
            child: InkWell(
                onTap: (){

                },
                child: CircleBtn(myicon: Icons.arrow_back_ios_new_rounded,iconsize: 28.00,))),
        leadingWidth: 80,

      ),
      body:Column(
        children: [
          ///Product items list...
           Expanded(
             child: SizedBox(
               width: double.infinity,
               child: ListView.builder(itemBuilder: (_,index){
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ///Product Images...
                              Container(
                                width: 90,
                                height: 90,
                                //margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: GrayClr(),
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: AssetImage(AppConstData.productdata[index]["pimg"]))
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
                                      Text(AppConstData.productdata[index]["pname"],style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "pop"),),
                                      SizedBox(height: 5,),
                                      Text(AppConstData.productdata[index]["type"],style: TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: "pop"),),
                                      SizedBox(height: 5,),
                                      Text("\$${AppConstData.productdata[index]["price"]}.00",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "pop"),),
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
                            child: IconButton(onPressed: (){}, icon:Icon(Icons.delete,size: 28,color: Colors.red,)),
                        ),
                        ///Add Items Count++,-- ..
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: Container(
                            width: 110,
                            height:38,
                            decoration: BoxDecoration(
                              color: GrayClr(),
                                borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)
                            ),

                            child: Row(
                              children: [
                                ///Count-- ...
                                InkWell(
                                    onTap:(){
                                      if(count>1){
                                        count--;
                                      }
                                      setState(() {

                                      });
                                    },
                                    child: Image.asset("assets/icons/minus.png",width: 25,)),
                                ///Count Update..
                                Text("$count",style: mytext16(myFontweight: FontWeight.bold),),
                                ///Count++..
                                InkWell(
                                    onTap: (){
                                      count++;
                                      setState(() {

                                      });
                                    },
                                    child:Image.asset("assets/icons/add.png",width: 25,) )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            ),
                          ),
                        ),


                      ],
                    ),
                  );
                },
                itemCount: 5,
                ),
              ),
           ),
          SizedBox(height: 10,),
          ///Total bill...
          Container(
            width: double.infinity,

            decoration: BoxDecoration(
                color: WhiteClr(),
              borderRadius: BorderRadius.vertical(top: Radius.circular(35))
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///Discount Code..
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        suffix: Text("Apply",style: mytext16(mycolor: OrangeClr(),myFontweight: FontWeight.w700),),
                        hintText: "Enter Discount Code",
                      ),
                    ),
                    SizedBox(height: 10,),
                    ///SubTotal..
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'pop'),),
                        Text("\$240.00",style: mytext16(myFontweight: FontWeight.w900),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(thickness: 2,),
                    ///Total Amount...
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily: 'pop'),),
                        Text("\$240.00",style: mytext16(myFontweight: FontWeight.w900),)
                      ],
                    ),
                     SizedBox(height: 20,),
                    ///Checkout Button...
                    RoundedBtn(btnname: "Checkout",textsize: 21.00,btnheight: 55.00,btnwidth: double.infinity,)
                  ],
                ),
              ),
            ),
          )
        ],
      ) ,
    );
  }

}

