
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/create_order_bloc/create_order_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/cart_page/create_order_bloc/create_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent,CreateOrderState>{
  ApiHelper apiHelper;
  CreateOrderBloc({required this.apiHelper}):super(CreateOrderIntialState()){
    on<getOrderCreateEvent>((event,emit)async{
      emit(CreateOrderLoadingState());
      try{
        var resp =await apiHelper.postApi(url: Urls.CREATE_ODERS_API,);
        if(resp['status']||resp['status']=="true"){
          emit(CreateOderSuccessState());
        }else{
          emit(CreateOrderFaliureState(errorMsg: resp['message']));
        }
      }catch(e){
        emit(CreateOrderFaliureState(errorMsg: e.toString()));
      }
    });
  }
}