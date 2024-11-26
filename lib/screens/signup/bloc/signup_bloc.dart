
import 'package:ecommerce_app/data/remotes/app_exception.dart';
import 'package:ecommerce_app/data/remotes/urls.dart';
import 'package:ecommerce_app/screens/signup/bloc/signup_event.dart';
import 'package:ecommerce_app/screens/signup/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remotes/api_helper.dart';

class SignupBloc extends Bloc<SignupEvent,SignupState>{
  ApiHelper apiHelper;
  SignupBloc({required this.apiHelper}):super(SignupIntialState()){
    on<SignupUser>((event,emit)async{
      emit(SignupLoadingState());
      try{
       dynamic response = await apiHelper.postApi(url: Urls.REGISTRATION_API,isHeaders: false,mBodyParms: {
          "name":event.name,
          "mobile_number":event.mobile,
          "email":event.email,
          "password":event.password
        });
       if(response['status']){
         emit(SignupSuccessState());
       }else{
         emit(SignupFaliureState(errorMsg: response['message']));
       }
      }catch(e){
        emit(SignupFaliureState(errorMsg: e.toString()));
      }
    });
  }
}