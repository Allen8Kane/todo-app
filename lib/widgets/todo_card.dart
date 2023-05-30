import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String id;
  final String title;
  final bool completed;
  final Function(int) toggleComplete;
  final int index;

  const TodoCard({
    Key? key,
    required this.id,
    required this.title,
    required this.completed,
    required this.toggleComplete,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleComplete(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
          child: Container(
              padding: const EdgeInsets.all(20),
              height: 125,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      completed ? Icons.check : Icons.close,
                      color: completed ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
