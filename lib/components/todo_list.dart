import 'package:get/get.dart';

class Todo {
  String title;
  final RxBool completed;
  Todo({required this.title, bool completed = false})
      : completed =
            RxBool(completed);
}

class TodoList extends GetxController {
  var todos = <Todo>[].obs;

  bool checkTodoExist(String title) {
    return todos.any((todo) => todo.title == title);
  }

  // stack approach
  void addTodo(String title) {
    todos.insert(0, Todo(title: title));
  }

  void deleteTodo(int index) {
    todos[index].completed.close();
    todos.removeAt(index);
  }
  void toggleTodo(int index) {
    todos[index].completed.value = !todos[index].completed.value;
  }
  void editTodo(int index, String text) {
    todos[index].title = text;
  }
}
