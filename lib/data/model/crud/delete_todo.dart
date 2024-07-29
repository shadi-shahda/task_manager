
class DeleteTodoModel {
  int id;
  String todo;
  bool completed;
  int userId;
  bool isDeleted;
  DateTime deletedOn;

  DeleteTodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
    required this.isDeleted,
    required this.deletedOn,
  });

  factory DeleteTodoModel.fromJson(Map<String, dynamic> json) => DeleteTodoModel(
    id: json["id"],
    todo: json["todo"],
    completed: json["completed"],
    userId: json["userId"],
    isDeleted: json["isDeleted"],
    deletedOn: DateTime.parse(json["deletedOn"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
    "isDeleted": isDeleted,
    "deletedOn": deletedOn.toIso8601String(),
  };
}
