
import 'package:ecommerce_app/data/model/view_cart_model.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/bloc/cart_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  ApiHelper apiHelper;
  CartBloc({required this.apiHelper}):super(CartInitialState()){
    on<getCartEvent>((event,emit)async{
      emit(CartLoadingState());
      try{
      var resp= await apiHelper.getApi(url: Urls.VIEW_CART_API);
      if(resp['status']||resp['status']=="true"){
        emit(CartLoadedState(mData: CartDataModel.fromJson(resp)));
      }else{
        emit(CartErrorState(errorMsg: resp['message']));
      }
      }catch (e){
        emit(CartErrorState(errorMsg: e.toString()));
      }
    });
  }
}