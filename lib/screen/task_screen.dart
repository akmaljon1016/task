import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/bloc/bloc/tasks_bloc.dart';
import 'package:task/widgets/task_list.dart';

import '../bloc/bloc_exports.dart';
import '../model/task.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    void _addTask(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
                child: Container(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        const Text(
                          'Add Task',
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                                label: Text('Title'),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        TextButton(onPressed: (){}, child: Text('Cancel')),
                        ElevatedButton(onPressed: (){
                          var task=Task(title: titleController.text);
                        }, child:Text("Add"))
                      ],
                    ),
                  ),
                ),
              ));
    }

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Task App'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                  label: Text("Task"),
                ),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            child: const Icon(Icons.add),
            tooltip: 'Add Task',
          ),
        );
      },
    );
  }
}
