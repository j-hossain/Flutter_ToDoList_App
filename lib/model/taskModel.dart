class ToDoTask{
  final String id;
  final String name;
  bool state;
  ToDoTask({required this.id, required this.name, required this.state});
  factory ToDoTask.fromJson(Map<String, dynamic> json) {
    return ToDoTask(
      id: json['id'],
      name: json['content'],
      state: json['is_completed'],
    );
  }
}