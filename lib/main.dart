import 'package:f_lesson_2/models/todo.dart';
import 'package:f_lesson_2/widgets/counter.dart';
import 'package:f_lesson_2/widgets/new_todo.dart';
import 'package:f_lesson_2/widgets/todo_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> _todos = [
    const Todo(
      id: "890123",
      title: "Pet the Cat",
      completed: true,
    ),
    const Todo(
      id: "123456",
      title: "Take out the trash",
      completed: true,
    ),
    const Todo(
      id: "789012",
      title: "Do the laundry",
      completed: false,
    ),
    const Todo(
      id: "345678",
      title: "Make dinner",
      completed: false,
    ),
  ];

  int get _completedCount => _todos.where((todo) => todo.completed).length;

  void _addTodo(String title) {
    setState(() {
      _todos.add(
        Todo(
          id: DateTime.now().toString(),
          title: title,
          completed: false,
        ),
      );
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      _todos[index] = _todos[index].copyWith(
        completed: !_todos[index].completed,
      );
    });
  }

  void _showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTodo(
          addTodo: _addTodo,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Couter(
                todoCount: _todos.length,
                completeCount: _completedCount,
              ),
              TodoList(todos: _todos, toggleComplete: _toggleComplete,),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTodoModal(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
