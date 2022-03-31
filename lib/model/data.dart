class Todo {
  String task;
  Todo(this.task);

  Todo.fromMap(Map map) : task = map['task'];

  Map toMap() {
    return {
      'task': task,
    };
  }
}
