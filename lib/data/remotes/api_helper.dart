
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/data/remotes/app_exception.dart';
import 'package:ecommerce_app/utils/app_const_data_page.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class ApiHelper{
  ///GetApi
  Future<dynamic> getApi({required String url})async{
    var uri = Uri.parse(url);
    SharedPreferences pref =await SharedPreferences.getInstance();
    try{
      var resp = await http.get(uri,
          headers: {
        "Authorization":"Bearer ${pref.getString(AppConstData.PREF_UID)}"
      });
      return returnJsonResponse(resp);
    }on SocketException catch(e){
      FetchDataException(errorMsg: "No Internet available!!");
    }
  }

  ///PostApi..
  Future<dynamic> postApi({
    required String url,
    bool isHeaders=true,
    Map<String,String>?mHeaders,
    Map<String,dynamic>?mBodyParms
  })async{
    var uri = Uri.parse(url);
    try{
      SharedPreferences pref =await SharedPreferences.getInstance();
      String uid= pref.getString(AppConstData.PREF_UID)??"";
      var resp =await http.post(uri,headers: isHeaders?{
        "Authorization" : "Bearer $uid"
      }:null,body: mBodyParms!=null?jsonEncode(mBodyParms):null);
      return returnJsonResponse(resp);
    }on SocketException catch(e){
      FetchDataException(errorMsg: "No Internet available!!");
    }
  }



  ///getApi Response..
  dynamic returnJsonResponse(http.Response response){
    switch(response.statusCode){
      case 200:{
        var mData = jsonDecode(response.body);
        return mData;
      }
      case 400:
        throw BadeRequestException(errorMsg: response.body.toString());
      case 401:
        throw UnauthorizedException(errorMsg: response.body.toString());
      case 404:
        FetchDataException(errorMsg: response.body.toString());
      case 429:
        throw ClientException(errorMsg: response.body.toString());
      case 500:
        throw InternalserverException(errorMsg: response.body.toString());
      default:
        throw FetchDataException(errorMsg: response.body.toString());
    }
  }
}