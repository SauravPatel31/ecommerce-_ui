
import 'package:ecommerce_app/utils/custom_widget_page.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_const_data_page.dart';
import '../../../utils/styling_page.dart';

class CategoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        centerTitle: true,
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 15,crossAxisSpacing: 15,mainAxisExtent: 200),
          itemCount: AppConstData.categorydata.length,
          itemBuilder: (_,index){
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppConstData.categorydata[index]['categoryimg']),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: Text(AppConstData.categorydata[index]['categoryname'],textAlign: TextAlign.center,style: mytext22(myFontweight: FontWeight.w900,mycolor: OrangeClr()),),),
        ) ;
      }),
    );
  }

}