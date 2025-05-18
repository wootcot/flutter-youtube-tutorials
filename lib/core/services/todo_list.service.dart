import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_tutorials/core/models/todo_list.model.dart';

part 'todo_list.service.g.dart';

@Riverpod(keepAlive: true)
TodoListMockService todoListService(Ref ref) {
  return TodoListMockService();
}

class TodoListMockService {
  List<Todo> list = [];

  Future<List<Todo>> get() async {
    await Future.delayed(const Duration(seconds: 1));
    return list;
  }

  Future<List<Todo>> add() async {
    await Future.delayed(const Duration(seconds: 1));
    final title = faker.lorem.sentence();
    final newTodo = Todo(title: title);
    list = [...list, newTodo];
    return list;
  }

  Future<List<Todo>> remove(int index) async {
    await Future.delayed(const Duration(seconds: 1));
    list.removeAt(index);
    return list;
  }
}
