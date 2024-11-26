
import 'package:ecommerce_app/data/remotes/app_exception.dart';
import 'package:ecommerce_app/data/remotes/urls.dart';
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/remotes/api_helper.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  ApiHelper apiHelper;
  LoginBloc({required this.apiHelper}):super(LoginIntialState()){
    on<LoginUser>((event,emit)async{
      emit(LoginLoadingState());
      try{
       dynamic response = await apiHelper.postApi(url: Urls.LOGIN_API,isHeaders: false,mBodyParms: {
          "email":event.email,
          "password":event.password
        });
       if(response['status']){
         var uid = response['tokan'];
         SharedPreferences pref =await SharedPreferences.getInstance();
         pref.setString(AppConstData.PREF_UID, uid);
         emit(LoginSuccessState());
       }else{
         emit(LoginFaliureState(errorMsg: response['message']));
       }
      }catch(e){
        emit(LoginFaliureState(errorMsg: (e as AppException).toErrorMsg()));
      }
    });
  }
}