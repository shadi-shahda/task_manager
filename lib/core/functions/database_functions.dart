import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/local_storage/sql_db.dart';
import 'package:flutter_application_1/data/model/todos/limit_and_skip_todo.dart';
import 'package:flutter_application_1/dependency_injection.dart' as di;


getInsertedTodos() async {
  insertedTodos = await  di.obj<SqlDb>().readData(
      "$readFromDatabase '$insertedTodosDataBaseTableName'"
  );
  for(var element in insertedTodos){
    SkipAndLimitTodoItemModel sipAndLimitTodoItemModel = SkipAndLimitTodoItemModel.fromJson(element);
    skipAndLimitTodoModel!.todos.insert(0,sipAndLimitTodoItemModel);
  }

  return;
}

getDeletedTodos() async{
  deletedTodos = await di.obj<SqlDb>().readData(
      "$readFromDatabase '$deletedTodosDataBaseTableName'"
  );
  for(var element in deletedTodos){
    SkipAndLimitTodoItemModel sipAndLimitTodoItemModel = SkipAndLimitTodoItemModel.fromJson(element);
    skipAndLimitTodoModel!.todos.removeWhere((element) => sipAndLimitTodoItemModel.id == element.id);
  }
  return;
}