abstract class LoginState{}

class LoginIntialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class LoginFaliureState extends LoginState{
  String errorMsg;
  LoginFaliureState({required this.errorMsg});
}

