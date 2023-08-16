import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/task/bloc_exports.dart';
import 'package:tasks_app/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasksList,
  });

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];

            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(UpdateTask(task: task));
                },
              ),
              onLongPress: () =>
                  context.read<TaskBloc>().add(DeleteTask(task: task)),
            );
          }),
    );
  }
}
