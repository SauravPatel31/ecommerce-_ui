import 'package:ecommerce_app/data/remotes/api_helper.dart';
import 'package:ecommerce_app/screens/dashboard/bottom_nav_provider.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/bloc/cart_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/create_order_bloc/create_order_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/delete_cart_bloc/product_remove_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/cat_bloc/category_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/product_bloc/product_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/bloc/add_to_cart_bloc.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/profile_page/bloc/profile_bloc.dart';
import 'package:ecommerce_app/screens/login/bloc/login_bloc.dart';
import 'package:ecommerce_app/screens/signup/bloc/signup_bloc.dart';
import 'package:ecommerce_app/screens/splash_page.dart';
import 'package:ecommerce_app/theme_provider.dart';
import 'package:ecommerce_app/utils/styling_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc(apiHelper: ApiHelper()),),
        BlocProvider(create: (context) => LoginBloc(apiHelper: ApiHelper()),),
        BlocProvider(create: (context)=> ProductBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>CategoryBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>AddToCartBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>CartBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>ProductRemoveBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>ProfileBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>PlaceOderBloc(apiHelper: ApiHelper())),
        BlocProvider(create: (context)=>CreateOrderBloc(apiHelper: ApiHelper())),
        ChangeNotifierProvider(create: (context)=>BottomNavProvider()),
        ChangeNotifierProvider(create: (context)=>ThemeProvider())
      ],
      child: MyApp()));
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    context.read<ThemeProvider>().getPrefValue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: context.watch<ThemeProvider>().getThemeValue()?ThemeMode.dark:ThemeMode.light,
      home:SplashPage(),
    );
  }

}






