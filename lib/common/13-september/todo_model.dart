class TodoTask {
  final String id;
  final String title;
  bool isCompleted;

  TodoTask({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}