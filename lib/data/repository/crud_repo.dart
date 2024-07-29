import 'dart:convert';

import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/local_storage/sql_db.dart';
import 'package:flutter_application_1/data/model/crud/create_todo.dart';
import 'package:flutter_application_1/data/model/crud/delete_todo.dart';
import 'package:flutter_application_1/data/model/crud/update_todo.dart';
import 'package:flutter_application_1/data/model/todos/limit_and_skip_todo.dart';
import 'package:flutter_application_1/data/web_services/crud_web_services.dart';
import 'package:flutter_application_1/dependency_injection.dart' as di;

class CrudRepo {
  CrudWebServices crudWebServices;

  CrudRepo({required this.crudWebServices});

  Future<CreateTodoModel> createTodo(String todo, int userId) async {
    final response = await crudWebServices.createTodo(todo, userId);
    CreateTodoModel createTodoModel = CreateTodoModel.fromJson(response);
    int sqlResponse = await di.obj<SqlDb>().insertData(
        "INSERT INTO '$insertedTodosDataBaseTableName' ('todo','completed','userId') VALUES ('${createTodoModel.todo}',${createTodoModel.completed ? 1 : 0},${createTodoModel.userId}) ");
    String toJson = jsonEncode(createTodoModel);
    Map<String,dynamic> fromJson = jsonDecode(toJson);
    SkipAndLimitTodoItemModel skipAndLimitTodoItemModel = SkipAndLimitTodoItemModel.fromJson(fromJson);
    skipAndLimitTodoModel!.todos.insert(0, skipAndLimitTodoItemModel);
    return createTodoModel;
  }

  Future<UpdateTodoModel> updateTodo(int id, bool completed) async {
    final response = await crudWebServices.updateTodo(id, completed);
    UpdateTodoModel updateTodoModel = UpdateTodoModel.fromJson(response);
    return updateTodoModel;
  }

  Future<DeleteTodoModel> deleteTodo(int id) async {
    final response = await crudWebServices.deleteTodo(id);
    DeleteTodoModel deleteTodoModel = DeleteTodoModel.fromJson(response);
    int sqlResponse = await di.obj<SqlDb>().insertData(
        "INSERT INTO '$deletedTodosDataBaseTableName' ('id','todo','completed','userId') VALUES ('${deleteTodoModel.id}','${deleteTodoModel.todo}',${deleteTodoModel.completed ? 1 : 0},${deleteTodoModel.userId}) ");
    return deleteTodoModel;
  }
}
