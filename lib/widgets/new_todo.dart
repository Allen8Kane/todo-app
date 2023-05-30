import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  
  final Function(String) addTodo;
  
  const NewTodo({
    Key? key,
    required this.addTodo,
  }) : super(key: key);

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _todoController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Todo',
            ),
            maxLength: 15,
          ),
          TextButton(
            onPressed: () {
              widget.addTodo(_todoController.text);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
