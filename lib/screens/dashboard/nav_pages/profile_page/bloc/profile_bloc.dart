
import 'package:ecommerce_app/screens/dashboard/nav_pages/profile_page/bloc/profile_event.dart';
import 'package:ecommerce_app/screens/dashboard/nav_pages/profile_page/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/model/user_profile_model.dart';
import '../../../../../data/remotes/api_helper.dart';
import '../../../../../data/remotes/urls.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ApiHelper apiHelper;
  ProfileBloc({required this.apiHelper}):super(ProfileIntialState()){
    on<getUserData>((event,emit)async{
      emit(ProfileLoadingState());
      // var resp = await apiHelper.postApi(url: Urls.USER_PROFILE_API);
      // if(resp['status']||resp['status']=="true"){
      //   emit(ProfileLoadedState(mData: UserProfileModel.fromJson(resp)));
      // }else{
      //   emit(ProfileErrorState(errorMsg: resp['message']));
      // }
      try{
       var resp = await apiHelper.postApi(url: Urls.USER_PROFILE_API);
       if(resp['status']||resp['status']=="true"){
         emit(ProfileLoadedState(mData: UserProfileModel.fromJson(resp)));
       }else{
         emit(ProfileErrorState(errorMsg: resp['message']));
       }
      }catch (e){
            emit(ProfileErrorState(errorMsg: e.toString()));
      }
    });
  }
}