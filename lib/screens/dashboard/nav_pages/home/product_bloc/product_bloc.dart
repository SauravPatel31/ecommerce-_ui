
import 'package:ecommerce_app/data/model/product_data_model.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/product_bloc/product_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}):super(ProductIntialState()){
    on<getProductEvent>((event,emit)async{
      emit(ProductLoadingState());
      try{
        var response = await apiHelper.postApi(url: Urls.PRODUCTS_API);
        if(response['status']||response['status']=="true"){
          emit(ProductLoadedState(mData: ProductModel.fromJson(response)));
        }else{
          emit(ProductErrorState(errorMsg: response['message']));
        }
      }catch(e){
        emit(ProductErrorState(errorMsg: e.toString()));
      }
    });
  }
}