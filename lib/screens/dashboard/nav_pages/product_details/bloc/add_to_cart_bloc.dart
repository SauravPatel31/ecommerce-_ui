
import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/bloc/add_to_cart_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/product_details/bloc/add_to_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class AddToCartBloc extends Bloc<AddToCartEvent,AddToCartsState>{
  ApiHelper apiHelper;
  AddToCartBloc({required this.apiHelper}):super(AddToCartInitialState()){
    on<ProductAddToCartEvent>((event,emit)async{
      emit(AddToCartLoadingState());
      try{
       var resp =await apiHelper.postApi(url: Urls.ADDTOCART_API,mBodyParms: {
          "product_id":event.productId,
          "quantity":event.quantity
        });
       if(resp['status']||resp['status']=="true"){
         emit(AddToCartSuccessState());
       }else{
         emit(AddToCartFaliureState(errorMsg: resp['message']));
       }
      }catch(e){
        emit(AddToCartFaliureState(errorMsg: e.toString()));
      }
    });
  }
}