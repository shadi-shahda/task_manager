// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/local_storage/auth_local_storage.dart';
import 'package:flutter_application_1/data/model/auth/login_model.dart';
import 'package:flutter_application_1/data/web_services/auth_web_services.dart';

class AuthRepo {
  AuthWebServices authWebServices;

  AuthRepo({
    required this.authWebServices,
  });

  Future<LoginModel> login(String username, String password) async {
    final response = await authWebServices.login(username, password);
    LoginModel loginModel = LoginModel.fromJson(response);
    if (response.length > 1) {
      token = loginModel.token;
      await AuthLocalStorage.setToken(loginModel.token);
      await AuthLocalStorage.setRefreshToken(loginModel.refreshToken);
    }
    return loginModel;
  }
}
