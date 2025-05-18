import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_tutorials/core/models/todo_list.model.dart';
import 'package:flutter_tutorials/core/services/todo_list.service.dart';

part 'todo_list_async.notifier.g.dart';

@riverpod
class TodoListAsyncNotifier extends _$TodoListAsyncNotifier {
  TodoListMockService get _todoService => ref.read(todoListServiceProvider);

  @override
  FutureOr<TodoList> build() async {
    return get();
  }

  Future<TodoList> get() async {
    try {
      final result = await _todoService.get();
      return TodoList(todos: result);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
    return TodoList(todos: []);
  }

  Future<void> add() async {
    try {
      state = AsyncLoading<TodoList>().copyWithPrevious(state);
      final result = await _todoService.add();
      state = AsyncData(state.value!.copyWith(todos: result));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  Future<void> remove(int index) async {
    try {
      state = AsyncLoading<TodoList>().copyWithPrevious(state);
      final result = await _todoService.remove(index);
      state = AsyncData(state.value!.copyWith(todos: result));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
