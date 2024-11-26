abstract class LoginEvent{}

class LoginUser extends LoginEvent{
  String email,password;
  LoginUser({required this.email,required this.password});
}