import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TaskModel extends Equatable {
  final String title;
  final String id;
  bool? isDone;
  bool? isDeleted;

  TaskModel({
    required this.title,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskModel copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }

    return result;
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] ?? '',
      id: map['id'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  @override
  List<Object?> get props => [title, id, isDone, isDeleted];
}
