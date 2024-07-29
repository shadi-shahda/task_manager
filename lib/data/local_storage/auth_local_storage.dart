 import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/dependency_injection.dart' as di;

class AuthLocalStorage{
  static Future<void> setToken(String token)async{
    await di.obj<SharedPreferences>().setString('token', token);
    return;
  }

  static Future<String> getToken()async{
    String? token = await di.obj<SharedPreferences>().getString('token');
    if(token == null) {
      return '';
    } else{
      return token;
    }
  }

  static Future<void> setRefreshToken(String token)async{
    await di.obj<SharedPreferences>().setString('refreshToken', token);
    return;
  }

  static Future<String> getRefreshToken()async{
    String? token = await di.obj<SharedPreferences>().getString('refreshToken');
    if(token == null) {
      return '';
    } else{
      return token;
    }
  }

 }