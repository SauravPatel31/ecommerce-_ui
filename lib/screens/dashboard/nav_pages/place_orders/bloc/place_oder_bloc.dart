
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/place_orders/bloc/place_oder_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/place_oder_model.dart';
import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class PlaceOderBloc extends Bloc<PlaceOderEvent,PlaceOderState>{
  ApiHelper apiHelper;
  PlaceOderBloc({required this.apiHelper}):super(PlaceOderIntialState()){
    on<getAllOdersEvent>((event,emit)async{
      emit(PlaceOderLoadingState());
      try{
       var resp=await  apiHelper.postApi(url: Urls.GET_ODERS_API);
       if(resp['status']||resp['status']=="true"){
         emit(PlaceOderLoadedState(mData: PlaceOrderModel.fromJson(resp)));
       }else{
         emit(PlaceOderErrorState(errorMessage: resp['message']));
       }

      }catch (e){
        emit(PlaceOderErrorState(errorMessage: e.toString()));
      }
    });
  }
}