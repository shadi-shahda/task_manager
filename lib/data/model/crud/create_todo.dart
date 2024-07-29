
class CreateTodoModel {
  int id;
  String todo;
  bool completed;
  int userId;
  String errorMessage;

  CreateTodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
    required this.errorMessage,
  });

  factory CreateTodoModel.fromJson(Map<String, dynamic> json) => CreateTodoModel(
    id: json["id"]??0,
    todo: json["todo"]??'',
    completed: json["completed"]??false,
    userId: json["userId"]??0,
    errorMessage: json['errorMessage']??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
}
