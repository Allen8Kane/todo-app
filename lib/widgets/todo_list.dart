import 'package:f_lesson_2/widgets/todo_card.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int) toggleComplete;

  const TodoList({
    Key? key,
    required this.todos,
    required this.toggleComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, i) {
          return TodoCard(
            id: todos[i].id,
            title: todos[i].title,
            completed: todos[i].completed,
            toggleComplete: toggleComplete,
            index: i,
          );
        },
      ),
    );
  }
}
