import 'package:flutter_application_1/core/functions/database_functions.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/model/todos/get_all_todos.dart';
import 'package:flutter_application_1/data/model/todos/get_todo_by_id.dart';
import 'package:flutter_application_1/data/model/todos/limit_and_skip_todo.dart';
import 'package:flutter_application_1/data/repository/todos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodosRepo todosRepo;

  TodoCubit(this.todosRepo) : super(TodoInitial());

  getAllTodos() async {
    emit(TodosLoadingState());
    getAllTodosModel = await todosRepo.fetchTodos();
    if (getAllTodosModel!.errorMessage.isNotEmpty) {
      emit(TodoErrorState(getAllTodosModel!.errorMessage));
    } else {
      emit(TodosLoadedState(getAllTodosModel!));
    }
  }

  getTodosByUserId(int userId) async {
    emit(TodosLoadingState());
    getTodosByUserIdModel = await todosRepo.getTodosByUserId(userId);
  }

  skipAndLimitTodo() async {
    emit(TodosLoadingState());
    SkipAndLimitTodoModel skipAndLimitTodos = await todosRepo.skipAndLimitTodo();
    if (skipAndLimitTodoModel != null) {
      for (var element in skipAndLimitTodos.todos) {
      skipAndLimitTodoModel!.todos.add(element);
      await getDeletedTodos();
      }
    } else {
      skipAndLimitTodoModel = await todosRepo.skipAndLimitTodo();
      await getInsertedTodos();
      await getDeletedTodos();
    }
    if (skipAndLimitTodoModel!.errorMessage.isNotEmpty) {
      emit(TodoErrorState(skipAndLimitTodoModel!.errorMessage));
    } else {
      emit(SkipANdLimitTodoGotState(skipAndLimitTodoModel!));
    }
  }

  getTodoById(int id) async {
    emit(TodosLoadingState());
    final getTodoByIdModel = await todosRepo.getTodoById(id);
    if (getTodoByIdModel.errorMessage.isNotEmpty) {
      emit(TodoErrorState(getTodoByIdModel.errorMessage));
    } else {
      emit(TodoGotState(getTodoByIdModel));
    }
  }
}
