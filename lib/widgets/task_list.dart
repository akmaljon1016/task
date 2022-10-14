import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;
  const TaskList({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {},
              ),
            );
          }),
    );
  }
}
