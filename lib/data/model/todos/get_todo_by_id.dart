
class GetTodoByIdModel {
  int id;
  String todo;
  bool completed;
  int userId;
  String errorMessage;

  GetTodoByIdModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
    required this.errorMessage,
  });

  factory GetTodoByIdModel.fromJson(Map<String, dynamic> json) => GetTodoByIdModel(
    id: json["id"]??0,
    todo: json["todo"]??'',
    completed: json["completed"]??false,
    userId: json["userId"]??0,
    errorMessage: json["errorMessage"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
}
