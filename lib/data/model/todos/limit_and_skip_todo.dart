class SkipAndLimitTodoModel {
  List<SkipAndLimitTodoItemModel> todos;
  int total;
  int skip;
  int limit;
  String errorMessage;

  SkipAndLimitTodoModel({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
    required this.errorMessage,
  });

  factory SkipAndLimitTodoModel.fromJson(Map<String, dynamic> json) =>
      SkipAndLimitTodoModel(
        todos: List<SkipAndLimitTodoItemModel>.from(
            json["todos"].map((x) => SkipAndLimitTodoItemModel.fromJson(x))),
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
        errorMessage: json["errorMessage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class SkipAndLimitTodoItemModel {
  int id;
  String todo;
  bool completed;
  int userId;

  SkipAndLimitTodoItemModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory SkipAndLimitTodoItemModel.fromJson(Map<String, dynamic> json) =>
      SkipAndLimitTodoItemModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"] == 0
            ? false
            : json["completed"] == 1
                ? true
                : json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
