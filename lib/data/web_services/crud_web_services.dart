import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';

class CrudWebServices {
  Future<Map<String, dynamic>> createTodo(String todo, int userId) async {
    var data = {
      "todo": todo,
      "completed": false,
      "userId": userId,
    };
    var dio = Dio(options);
    var response = await dio.request(
      'todos/add',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    if (response.statusCode == 201) {
      return response.data;
    } else {
      return {'errorMessage': response.statusMessage};
    }
  }

  Future<Map<String, dynamic>> updateTodo(int id, bool completed) async {
    var headers = {'Content-Type': 'application/json'};
    var data = {"completed": completed};
    var dio = Dio(options);
    var response = await dio.request(
      'todos/$id',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'errorMessage': response.statusMessage};
    }
  }

  Future<Map<String, dynamic>> deleteTodo(int id) async {
    var dio = Dio(options);
    var response = await dio.request(
      'todos/$id',
      options: Options(
        method: 'DELETE',
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'errorMessage': response.statusMessage};
    }
  }
}
