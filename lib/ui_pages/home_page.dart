import 'package:ecommerce_app/ui_pages/add_to_cart_page.dart';
import 'package:ecommerce_app/ui_pages/my_cart_page.dart';
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:WhiteClr() ,
        appBar: AppBar(
          backgroundColor: WhiteClr(),
          leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: CircleAvatar(
                maxRadius: 30,
                backgroundColor: GrayClr(),
                child: Image.asset("assets/icons/dotted-line.png",width: 35,)),
          ),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: CircleBtn(myicon: Icons.notifications_outlined,mycolor: GrayClr(),))
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.filter_list),)
                ),
              ),
                SizedBox(height: 15,),
                ///Image Slider...
                SizedBox(
                  height: 200,
                  child: Stack(
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
                ),
                SizedBox(height: 10,),
                ///Category List...
                Container(
                  height: 150,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ///Category Image
                          CircleAvatar(
                            backgroundImage: AssetImage(AppConstData.categorydata[index]["categoryimg"]),
                            maxRadius: 35,
                          ),
                          SizedBox(height: 10,),
                          ///Category Name..
                          Container(
                              width:70,
                              child: Text(AppConstData.categorydata[index]["categoryname"],textAlign: TextAlign.center,style: mytext11(myFontweight: FontWeight.w700),))
                        ],
                      ),
                    );
                  },
                  itemCount: AppConstData.categorydata.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                ///Text Special For you and See all...
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Special For You",style: mytext16(myFontweight: FontWeight.w900),),
                    Text("See all",style: mytext11(mycolor: Colors.grey),)
                  ],
                ),
                SizedBox(height: 10,),
                ///Special For You GridView...
                Container(
                  width: double.infinity,
                  height: 600,
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,mainAxisExtent: 200),
                      itemBuilder: (_,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddToCartPage(sindex: index)));
                          },
                          child: Hero(
                            tag: "$index",
                            child: ProductInfo(
                              product_img: AppConstData.productdata[index]["pimg"],
                              product_name: AppConstData.productdata[index]["pname"],
                              product_price:AppConstData.productdata[index]["price"] ,
                              //choesColors: Color(AppConstData.productdata[index]["pcolor"]),
                            ),
                          ),
                        ) ;
                        },
                    itemCount: AppConstData.productdata.length,

                      ),
                )
              ],
            ),
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
