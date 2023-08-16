part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskModel> allTaks;
  final String? errorMessage;

  const TaskState({
    this.allTaks = const <TaskModel>[],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [allTaks, errorMessage];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'allTaks': allTaks.map((x) => x.toMap()).toList()});
    if (errorMessage != null) {
      result.addAll({'errorMessage': errorMessage});
    }

    return result;
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTaks: List<TaskModel>.from(
          map['allTaks']?.map((x) => TaskModel.fromMap(x))),
      errorMessage: map['errorMessage'],
    );
  }
}
