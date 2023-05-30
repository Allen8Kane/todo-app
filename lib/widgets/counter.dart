import 'package:flutter/material.dart';

class Couter extends StatelessWidget {
  final int todoCount;
  final int completeCount;

  const Couter({
    Key? key,
    required this.todoCount,
    required this.completeCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Text(
        '$completeCount/$todoCount',
        style: TextStyle(
          fontSize: 75,
          color: completeCount == todoCount ? Colors.green : Colors.black,
        ),
      ),
    );
  }
}
