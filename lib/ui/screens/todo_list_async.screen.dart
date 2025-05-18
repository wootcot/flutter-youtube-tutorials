import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_tutorials/core/screen_controllers/todo_list_async.notifier.dart';

class TodoListAsyncScreen extends ConsumerWidget {
  const TodoListAsyncScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListAsyncNotifierProvider);
    final stateNotifier = ref.read(todoListAsyncNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text("Todo Async List")),
      floatingActionButton: FloatingActionButton(
        onPressed: stateNotifier.add,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child:
            state.value == null
                ? Center(child: CircularProgressIndicator())
                : state.hasError
                ? Center(
                  child: Text(
                    state.error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                )
                : Column(
                  children: [
                    Expanded(
                      child:
                          state.value!.todos.isEmpty
                              ? Center(child: Text("List is Empty"))
                              : ListView.builder(
                                itemCount: state.value!.todos.length,
                                itemBuilder: (context, index) {
                                  final item = state.value!.todos[index];
                                  return Dismissible(
                                    key: Key(item.title),
                                    confirmDismiss: (direction) {
                                      stateNotifier.remove(index);
                                      return Future.value(false);
                                    },
                                    child: ListTile(title: Text(item.title)),
                                  );
                                },
                              ),
                    ),
                    if (state.isLoading)
                      Center(child: CircularProgressIndicator()),
                  ],
                ),
      ),
    );
  }
}
