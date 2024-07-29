import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/model/todos/limit_and_skip_todo.dart';

class TodosWebServices {
  Future<Map<String, dynamic>> fetchAllTodos() async {
    var dio = Dio(options);
    var response = await dio.request(
      'todos',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'errorMessage': 'error'};
    }
  }

  Future<Map<String, dynamic>> skipAndLimitTodo() async {
    var dio = Dio(options);
    var response = await dio.request(
      'todos?limit=$limit&skip=$skip',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      skip += limit;
      return response.data;
    } else {
      return {'errorMessage': 'error'};
    }
  }

  Future<Map<String, dynamic>> getTodosByUserId(int userId) async {
    Dio dio = Dio(options);
    var response = await dio.request(
      '',
      options: Options(
        method: 'GET',
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'errorMessage': 'error'};
    }
  }

  Future<Map<String, dynamic>> getTodoById(int id) async {
    var dio = Dio(options);
    var response = await dio.request(
      'todos/$id',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'errorMessage': 'error'};
    }
  }
}
