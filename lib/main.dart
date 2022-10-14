import 'package:flutter/material.dart';
import 'package:task/screen/task_screen.dart';

import 'bloc/bloc_exports.dart';
import 'model/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(AddTask(task: Task(title: 'task1'))),
      child: MaterialApp(
        title: 'Flutter Task App',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
