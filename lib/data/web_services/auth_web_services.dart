import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';

class AuthWebServices {
  Future<Map<String, dynamic>> login(String username, String password) async {
    var data = {
      "username": 'emilys',
      "password": 'emilyspass',
      "expiresInMins": 1440
    };
    var dio = Dio(options);
    var response = await dio.request(
      'auth/login',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'errorMessage': 'error'};
    }
  }
}
