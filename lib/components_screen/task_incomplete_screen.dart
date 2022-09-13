import 'package:flutter/material.dart';
class TaskIncomplete extends StatefulWidget {
  final String? id;
  final String? name;
  const TaskIncomplete({Key? key,this.id,this.name}) : super(key: key);

  @override
  State<TaskIncomplete> createState() => _TaskIncompleteState();
}

class _TaskIncompleteState extends State<TaskIncomplete> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Task Incomplete"),
      ),
    );
  }
}
