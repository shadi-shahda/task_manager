import 'package:flutter_application_1/data/model/user_info/get_user.dart';
import 'package:flutter_application_1/data/web_services/user_info_web_services.dart';

class UserInfoRepo {
  UserInfoWevServices userInfoWevServices;
  UserInfoRepo({
    required this.userInfoWevServices,
  });

  Future<GetUserModel> getUser()async{
    final response = await userInfoWevServices.getUser();
    GetUserModel getUserModel = GetUserModel.fromJson(response);
    return getUserModel;
  }
}
