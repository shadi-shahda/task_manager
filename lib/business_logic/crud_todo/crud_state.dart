part of 'crud_cubit.dart';

@immutable
sealed class CrudState {}

final class CrudInitial extends CrudState {}

class CreatingTodoLoadingState extends CrudState{}

class TodoCreatedState extends CrudState{
  CreateTodoModel createTodoModel;

  TodoCreatedState(this.createTodoModel);
}

class UpdatingTodoLoadingState extends CrudState{}

class TodoUpdatedState extends CrudState{
  UpdateTodoModel updateTodoModel;

  TodoUpdatedState(this.updateTodoModel);
}

class DeletingTodoLoadingState extends CrudState{}

class TodoDeletedState extends CrudState{
  DeleteTodoModel deleteTodoModel;

  TodoDeletedState(this.deleteTodoModel);
}
