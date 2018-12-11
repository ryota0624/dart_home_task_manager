
import 'dart:async';

import 'package:angular/core.dart';

import 'task.dart';

import 'package:firebase/firebase.dart';

@Injectable()
class TaskService {
  List<Task> mockTasks = [
    Task(TaskName("SOUZI"), Routine.Daily),
    Task(TaskName("TOILET"), Routine.Daily),
    Task(TaskName("WWEEEEKY"), Routine.Weekly),
  ];

  List<TaskComplete> mockTaskCompletes = [
    TaskComplete(TaskName("SOUZI"), DateTime.now()),
  ];

  Future<List<Task>> getTasks() async => mockTasks;

  Future<List<TaskComplete>> getTaskCompletes(DateTime dateTime) async => mockTaskCompletes;

  Future<void> completeTask(Task task) async {
    print("${task.name} is completed");
  }

  Future<void> unCompleteTask(Task task) async {
    print("${task.name} is unCompleted");
  }
}
