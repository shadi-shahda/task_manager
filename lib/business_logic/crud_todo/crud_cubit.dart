import 'package:flutter_application_1/data/model/crud/create_todo.dart';
import 'package:flutter_application_1/data/model/crud/delete_todo.dart';
import 'package:flutter_application_1/data/model/crud/update_todo.dart';
import 'package:flutter_application_1/data/repository/crud_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  CrudRepo crudRepo;
  CrudCubit(this.crudRepo) : super(CrudInitial());

  createTodo(String todo,int userId)async{
    emit(CreatingTodoLoadingState());
    final createTodoModel = await crudRepo.createTodo(todo, userId);
    emit(TodoCreatedState(createTodoModel));
  }

  updateTodo(int id,bool completed)async{
    emit(UpdatingTodoLoadingState());
    final updateTodoModel = await crudRepo.updateTodo(id,completed);
    emit(TodoUpdatedState(updateTodoModel));
  }

  deleteTodo(int id)async{
    emit(DeletingTodoLoadingState());
    final deleteTodoModel = await crudRepo.deleteTodo(id);
    emit(TodoDeletedState(deleteTodoModel));
  }

}
