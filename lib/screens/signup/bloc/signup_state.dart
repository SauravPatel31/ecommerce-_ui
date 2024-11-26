abstract class SignupState{}

class SignupIntialState extends SignupState{}
class SignupLoadingState extends SignupState{}
class SignupSuccessState extends SignupState{}
class SignupFaliureState extends SignupState{
  String errorMsg;
  SignupFaliureState({required this.errorMsg});
}