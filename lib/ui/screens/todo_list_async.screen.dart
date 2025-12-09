import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:wootcot_simplified/core/screen_controllers/todo_list_async.notifier.dart';

class TodoListAsyncScreen extends ConsumerStatefulWidget {
  const TodoListAsyncScreen({super.key});

  @override
  ConsumerState<TodoListAsyncScreen> createState() =>
      _TodoListAsyncScreenState();
}

class _TodoListAsyncScreenState extends ConsumerState<TodoListAsyncScreen> {
  late GlobalKey<AnimatedListState> _listKey;

  @override
  void initState() {
    super.initState();
    _listKey = GlobalKey<AnimatedListState>();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoListAsyncNotifierProvider);
    final stateNotifier = ref.read(todoListAsyncNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Todo Async List")),
      floatingActionButton: FloatingActionButton(
        onPressed: stateNotifier.add,
        child:
            state.value != null && state.isLoading
                ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                )
                : Icon(Icons.add),
      ),
      body: SafeArea(
        child:
            state.value == null
                ? const Center(child: CircularProgressIndicator())
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
                              : AnimatedList(
                                key: _listKey,
                                initialItemCount: state.value!.todos.length,
                                itemBuilder: (context, index, animation) {
                                  final item = state.value!.todos[index];
                                  return SlideTransition(
                                    position: animation.drive(
                                      Tween(
                                        begin: Offset(1, 0),
                                        end: Offset(0, 0),
                                      ),
                                    ),
                                    child: Dismissible(
                                      key: Key(item.title),
                                      background: Container(
                                        color: Colors.red,
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      confirmDismiss: (direction) async {
                                        _listKey.currentState?.removeItem(
                                          index,
                                          (context, animation) =>
                                              SlideTransition(
                                                position: animation.drive(
                                                  Tween(
                                                    end: Offset(-1, 0),
                                                    begin: Offset(0, 0),
                                                  ),
                                                ),
                                                child: ListTile(
                                                  title: Text(item.title),
                                                ),
                                              ),
                                          duration: Duration(milliseconds: 300),
                                        );
                                        await stateNotifier.remove(index);
                                        return Future.value(false);
                                      },
                                      child: ListTile(title: Text(item.title)),
                                    ),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
      ),
    );
  }
}
