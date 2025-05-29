import 'package:faker/faker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:wootcot_simplified/core/models/todo_list.model.dart';

part 'todo_list.notifier.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  TodoList build() => TodoList(todos: []);

  void add() {
    final title = faker.lorem.sentence();
    final newTodo = Todo(title: title);
    state = state.copyWith(todos: [...state.todos, newTodo]);
  }

  void remove(int index) {
    final modifiedTodos = [...state.todos];
    modifiedTodos.removeAt(index);
    state = state.copyWith(todos: modifiedTodos);
  }
}
