
class UpdateTodoModel {
  int id;
  String todo;
  bool completed;
  int userId;

  UpdateTodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory UpdateTodoModel.fromJson(Map<String, dynamic> json) => UpdateTodoModel(
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
