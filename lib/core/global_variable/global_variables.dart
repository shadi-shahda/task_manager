import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/data/model/todos/get_all_todos.dart';
import 'package:flutter_application_1/data/model/todos/get_todos_by_user_id.dart';
import 'package:flutter_application_1/data/model/todos/limit_and_skip_todo.dart';
import 'package:flutter_application_1/data/model/user_info/get_user.dart';

String token = '';

Map<String,dynamic> headers = {};

GetUserModel? getUserModel;
GetAllTodosModel? getAllTodosModel;
SkipAndLimitTodoModel? skipAndLimitTodoModel;
GetTodosByUserIdModel? getTodosByUserIdModel;


int skip = 10;
int limit = 10;


BaseOptions options = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: const Duration(minutes: 1),
  receiveTimeout: const Duration(minutes: 1),
  receiveDataWhenStatusError: true,
);

///login controllers
final userNameController = TextEditingController();
final passwordController = TextEditingController();

///home screen controllers
final newTodoController = TextEditingController();

///database global variables
List<Map<String,Object?>> insertedTodos = [];
List<Map<String,Object?>> deletedTodos = [];
