
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/delete_cart_bloc/product_remove_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/delete_cart_bloc/product_remove_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class ProductRemoveBloc extends Bloc<ProductRemoveEvent,ProductRemoveState>{
  ApiHelper apiHelper;
  ProductRemoveBloc({required this.apiHelper}):super(ProductRemoveInitialState()){
    on<ProductRemoveE>((event,emit)async{
      emit(ProductRemoveLoadingState());
      try{
       var resp=await apiHelper.postApi(url: Urls.DELETE_CART_API,mBodyParms: {
         "cart_id":event.cart_Id
       });
       if(resp['status']||resp['status']=="true"){
         emit(ProductRemoveSuccessState());
       }else{
         emit(ProductRemoveFaliureState(errorMsg: resp['message']));
       }
      }catch(e){
        emit(ProductRemoveFaliureState(errorMsg: e.toString()));
      }
    });
  }
}