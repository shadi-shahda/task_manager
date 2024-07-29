

import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/local_storage/auth_local_storage.dart';

getToken() async{
  token = await AuthLocalStorage.getToken();
}