class AppException implements Exception{
  String title;
  String msg;
  AppException({required this.title,required this.msg});

  String toErrorMsg(){
    return "$title:-$msg";
  }
}

class FetchDataException extends AppException{
  FetchDataException({required String errorMsg}):super(title: "Network Error",msg: errorMsg);
}

class BadeRequestException extends AppException{
  BadeRequestException({required String errorMsg }):super(title: "Bade Request",msg: errorMsg);
}
class UnauthorizedException extends AppException{
  UnauthorizedException({required String errorMsg}):super(title: "Unauthorized",msg: errorMsg);
}
class ClientException extends AppException{
  ClientException({required String errorMsg}):super(title: "Client",msg: errorMsg);
}
class InternalserverException extends AppException{
  InternalserverException({required String errorMsg}):super(title: "Internalserver",msg:errorMsg);
}
