import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wootcot_simplified/ui/screens/todo_list_async.screen.dart';
import 'package:wootcot_simplified/core/screen_controllers/todo_list.notifier.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListNotifierProvider);
    final stateNotifier = ref.read(todoListNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Sync List"),
        actions: [
          TextButton(
            child: Text("Async Todo"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TodoListAsyncScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: stateNotifier.add,
        child: Icon(Icons.add),
      ),
      body:
          state.todos.isEmpty
              ? Center(child: Text("List is Empty"))
              : ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final item = state.todos[index];
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
    );
  }
}
