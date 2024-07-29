import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/local_storage/auth_local_storage.dart';
import 'package:flutter_application_1/data/model/auth/refresh_token.dart';

class UserInfoWevServices {
  Future<Map<String, dynamic>> getUser() async {
    headers.addAll({'Authorization': token});
    var dio = Dio(options);
    try{
      var response = await dio.request(
        'auth/me',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        String refreshToken = await AuthLocalStorage.getRefreshToken();
        await refreshTokenMethod(refreshToken);
        return getUser();
      } else {
        return {'errorMessage': 'error'};
      }
    }catch(e){
      if(e is DioException){
        if(e.response!.statusCode == 401){
          String refreshToken = await AuthLocalStorage.getRefreshToken();
          await refreshTokenMethod(refreshToken);
          return getUser();
        }else{
          return {'errorMessage': 'error'};
        }
      }else{
        return {'errorMessage': 'error'};
      }
    }
  }

  refreshTokenMethod(String refreshToken) async {
    var headers = {'Content-Type': 'application/json'};
    var data = {"refreshToken": refreshToken, "expiresInMins": 1};
    var dio = Dio(options);
    var response = await dio.request(
      'auth/refresh',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    if (response.statusCode == 200) {
      RefreshTokenModel refreshTokenModel =
          RefreshTokenModel.fromJson(response.data);
      token = refreshTokenModel.token;
      await AuthLocalStorage.setToken(token);
      await AuthLocalStorage.setRefreshToken(refreshTokenModel.refreshToken);
      print('refreshed');
      return refreshTokenModel;
    } else {
      RefreshTokenModel refreshTokenModel =
          RefreshTokenModel.fromJson({'errorMessage': 'error'});
      return refreshTokenModel;
    }
  }
}
