import 'package:equatable/equatable.dart';
import 'package:tasks_app/blocs/task/bloc_exports.dart';
import 'package:tasks_app/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        allTaks: List.from(state.allTaks)..add(event.task),
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int indexTask = state.allTaks.indexOf(task);

    List<TaskModel> allTasks = List.from(state.allTaks)..remove(task);
    task.isDone == false
        ? allTasks.insert(indexTask, task.copyWith(isDone: true))
        : allTasks.insert(indexTask, task.copyWith(isDone: true));

    emit(
      TaskState(
        allTaks: List.from(allTasks),
      ),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        allTaks: List.from(state.allTaks)..remove(event.task),
      ),
    );
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
