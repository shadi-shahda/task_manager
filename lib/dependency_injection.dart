import 'package:flutter_application_1/business_logic/crud_todo/crud_cubit.dart';
import 'package:flutter_application_1/business_logic/internet_cubit/internet_cubit.dart';
import 'package:flutter_application_1/business_logic/todo_cubit/todo_cubit.dart';
import 'package:flutter_application_1/business_logic/user_info_cubit/user_info_cubit.dart';
import 'package:flutter_application_1/data/local_storage/sql_db.dart';
import 'package:flutter_application_1/data/repository/auth_repo.dart';
import 'package:flutter_application_1/data/repository/crud_repo.dart';
import 'package:flutter_application_1/data/repository/todos_repo.dart';
import 'package:flutter_application_1/data/repository/user_info_repo.dart';
import 'package:flutter_application_1/data/web_services/auth_web_services.dart';
import 'package:flutter_application_1/data/web_services/crud_web_services.dart';
import 'package:flutter_application_1/data/web_services/todos_web_services.dart';
import 'package:flutter_application_1/data/web_services/user_info_web_services.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/auth_cubit/auth_cubit.dart';

final obj = GetIt.instance;

Future<void> init() async {
  ///cubits
  obj.registerFactory(() => InternetCubit());
  obj.registerFactory(() => AuthCubit(obj()));
  obj.registerFactory(() => UserInfoCubit(obj()));
  obj.registerFactory(() => TodoCubit(obj()));
  obj.registerFactory(() => CrudCubit(obj()));


  ///repo
  obj.registerLazySingleton(() => AuthRepo(authWebServices: obj()));
  obj.registerLazySingleton(() => UserInfoRepo(userInfoWevServices: obj()));
  obj.registerLazySingleton(() => TodosRepo(todosWebServices: obj()));
  obj.registerLazySingleton(() => CrudRepo(crudWebServices: obj()));

  ///web services
  obj.registerLazySingleton(() => AuthWebServices());
  obj.registerLazySingleton(() => UserInfoWevServices());
  obj.registerLazySingleton(() => TodosWebServices());
  obj.registerLazySingleton(() => CrudWebServices());

  ///external packages
  obj.registerLazySingleton(() =>InternetConnection());
  final sharedPreferences = await SharedPreferences.getInstance();
  obj.registerLazySingleton(() => sharedPreferences);
  SqlDb sqlDb = SqlDb();
  obj.registerLazySingleton(() => SqlDb());
}
