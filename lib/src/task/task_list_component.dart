import 'dart:async';
import 'package:angular/angular.dart';
import 'package:quiver/core.dart' as quiver;
import 'task_service.dart';
import 'task.dart';
import 'task_component.dart';

quiver.Optional<T> excToOp<T>(T get()) {
  try {
    return quiver.Optional.of(get());
  } catch (e) {
    return quiver.Optional.absent();
  }
}

class TaskWithComplete {
  final quiver.Optional<TaskComplete> complete;
  final Task task;

  TaskWithComplete(this.task, this.complete);
}

@Component(
  selector: 'task-list',
  styleUrls: ['task_list_component.css'],
  templateUrl: 'task_list_component.html',
  directives: [TaskComponent, NgFor],
  providers: [ClassProvider(TaskService)],
)
class TaskListComponent implements OnInit {
  @Input()
  DateTime dateTime;
  @Input()
  Routine routine;

  final TaskService _taskService;

  List<TaskWithComplete> taskWithCompletes = [];

  TaskListComponent(this._taskService);

  @override
  Future<Null> ngOnInit() async {
    var tasks = await _taskService.getTasks();
    var completes = await _taskService.getTaskCompletes(DateTime.now());

    taskWithCompletes =
        tasks.where((task) => task.routine == routine).map((task) {
      var completeOrNull = excToOp(
          () => completes.firstWhere((complete) => complete.name == task.name));
      return TaskWithComplete(task, completeOrNull);
    }).toList();
  }

  onChangeCheck(bool completed, TaskWithComplete task) {
    if (completed) {
      _taskService.completeTask(task.task);
    } else {
      _taskService.unCompleteTask(task.task);
    }
  }
}
