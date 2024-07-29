part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class TodosLoadingState extends TodoState{}

class TodosLoadedState extends TodoState{
  GetAllTodosModel getAllTodosModel;

  TodosLoadedState(this.getAllTodosModel);
}

class TodoErrorState extends TodoState{
  String errorMessage;
  TodoErrorState(this.errorMessage);
}

class TodoGotState extends TodoState{
  GetTodoByIdModel getTodoByIdModel;

  TodoGotState(this.getTodoByIdModel);
}

class SkipANdLimitTodoGotState extends TodoState{
  SkipAndLimitTodoModel skipAndLimitTodoModel;

  SkipANdLimitTodoGotState(this.skipAndLimitTodoModel);
}