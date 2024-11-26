abstract class SignupEvent {}

class SignupUser extends SignupEvent {
  String email;
  String password;
  String name;
  String mobile;
  SignupUser({required this.email,required this.password,required this.name,required this.mobile});
}