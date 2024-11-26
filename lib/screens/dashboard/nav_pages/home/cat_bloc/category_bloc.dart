import 'package:ecommerce_app/data/model/category_model.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/cat_bloc/category_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/home/cat_bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  ApiHelper apiHelper;
  CategoryBloc({required this.apiHelper}):super(CategoryIntialState()){
    on<GetCategoryEvent>((event,emit)async{
      emit(CategoryLoadingState());
      try{
         var resp = await  apiHelper.getApi(url: Urls.CTEGORIES_API);
         if(resp['status']||resp['status']=="true"){
           emit(CategoryLoadedState(mData: CategoryModel.fromJson(resp)));
         }else{
           emit(CategoryErrorState(errorMsg: resp['message']));
         }
      }catch (e){
        emit(CategoryErrorState(errorMsg: e.toString()));
      }
    });
  }
}