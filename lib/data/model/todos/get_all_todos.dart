
class GetAllTodosModel {
  List<Todo> todos;
  int total;
  int skip;
  int limit;
  String errorMessage;

  GetAllTodosModel({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
    required this.errorMessage,
  });

  factory GetAllTodosModel.fromJson(Map<String, dynamic> json) => GetAllTodosModel(
    todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))??[]),
    total: json["total"]??0,
    skip: json["skip"]??0,
    limit: json["limit"]??0,
    errorMessage: json["errorMessage"]??'',
  );

  Map<String, dynamic> toJson() => {
    "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Todo {
  int id;
  String todo;
  bool completed;
  int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    todo: json["todo"],
    completed: json["completed"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
}
