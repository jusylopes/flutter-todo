import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/utils/id_generator.dart';

import '../blocs/task/bloc_exports.dart';

class TaskFormAdd extends StatelessWidget {
  const TaskFormAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = TaskModel(title: titleController.text, id: IdGenerator.generate() );
                  context.read<TaskBloc>().add(AddTask(task: task));
                  Navigator.of(context);
                },
                child: const Text('Add'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
