import 'package:flutter_application_1/data/model/todos/get_all_todos.dart';
import 'package:flutter_application_1/data/model/todos/get_todo_by_id.dart';
import 'package:flutter_application_1/data/model/todos/get_todos_by_user_id.dart';
import 'package:flutter_application_1/data/model/todos/limit_and_skip_todo.dart';
import 'package:flutter_application_1/data/web_services/todos_web_services.dart';

class TodosRepo{
  TodosWebServices todosWebServices;

  TodosRepo({required this.todosWebServices});

  Future<GetAllTodosModel> fetchTodos() async{
    final response = await todosWebServices.fetchAllTodos();
    GetAllTodosModel getAllTodosModel = GetAllTodosModel.fromJson(response);
    return getAllTodosModel;
  }

  Future<GetTodosByUserIdModel> getTodosByUserId(int userId)async{
    final response = await todosWebServices.getTodosByUserId(userId);
    GetTodosByUserIdModel getTodosByUserId = GetTodosByUserIdModel.fromJson(response);
    return getTodosByUserId;
  }

  Future<SkipAndLimitTodoModel> skipAndLimitTodo() async{
    final response = await todosWebServices.skipAndLimitTodo();
    SkipAndLimitTodoModel skipAndLimitTodoModel = SkipAndLimitTodoModel.fromJson(response);
    return skipAndLimitTodoModel;
  }

  Future<GetTodoByIdModel> getTodoById(int id)async{
    final response = await todosWebServices.getTodoById(id);
    GetTodoByIdModel getTodoByIdModel = GetTodoByIdModel.fromJson(response);
    return getTodoByIdModel;
  }
}