

import 'dart:ui';

class AppConstData {

  ///preferences key...
  static final String PREF_UID="uid";
  static List<Map<String,dynamic>> categorydata=[
    {
      'categoryimg':'assets/images/categoryimg/sho.jpeg',
      'categoryname':'Shoes'
    },
    {
      'categoryimg':'assets/images/categoryimg/beauty.jpeg',
      'categoryname':'Beauty'
    },
    {
      'categoryimg':'assets/images/categoryimg/womeans_fashion.jpeg',
      'categoryname':"Women's Fashion"
    },
    {
      'categoryimg':'assets/images/categoryimg/jewelry.jpeg',
      'categoryname':'jewelry'
    },
    {
      'categoryimg':'assets/images/categoryimg/menfashion.jpg',
      'categoryname':"Men's Fashion"
    },
    {
      'categoryimg':'assets/images/categoryimg/watch.jpeg',
      'categoryname':"Watch's"
    },
    {
      'categoryimg':'assets/images/categoryimg/mobile.jpeg',
      'categoryname':"Mobile's"
    },

  ];
 static List<Map<String,dynamic>> productdata=[
   {
     'pimg':'assets/images/products_img/earbuds.png',
     'pname':'Wireless Headphones',
     'price':"120",
     'review':"350",
     'type':'Electronic',
     'pcolor':[0xff1B1B1B, 0xff31A1F2, 0xffFF660F]

   },
   {
     'pimg':'assets/images/products_img/womensweeter.png',
     'pname':'Woman Sweter',
     'price':"110",
     'review':"430",
     'type':'Woman Fashion',
   'pcolor': [0xff0000000, 0xff31A1F2,0xffFF660F]
    },
   {
     'pimg':'assets/images/products_img/menshoes.png',
     'pname':'Men Shoes',
     'price':"80",
     'review':"523",
     'type':'Men Fashion'
   },
   {
     'pimg':'assets/images/products_img/shirt.png',
     'pname':'Shirt',
     'price':"160",
     'review':"337",
     'type':'Men Fashion'
   },
   {
     'pimg':'assets/images/products_img/womenshoes.png',
     'pname':'Women Shoes',
     'price':"85",
     'review':"130",
     'type':'Woman Fashion'
   },
   {
     'pimg':'assets/images/products_img/gogals.png',
     'pname':'Gogals',
     'price':"78",
     'review':"193",
     'type':'Men Fashion'

   },
   {
     'pimg':'assets/images/products_img/samphone.png',
     'pname':'Phone',
     'price':"820",
     'review':"830",
     'type':'Electronic'
   },






 ];
}
