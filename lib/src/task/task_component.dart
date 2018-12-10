import 'dart:async';

import 'package:angular/angular.dart';
import 'package:quiver/core.dart' as quiver;
import 'task.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';


@Component(
  selector: 'task-item',
  styleUrls: ['task_component.css'],
  templateUrl: 'task_component.html',
  directives: [NgIf, formDirectives],
  providers: [],
)
class TaskComponent implements OnInit {
  @Input() Task task;
  @Input() quiver.Optional<TaskComplete> complete;

  final _onChangeCheckStatusStream =  StreamController<bool>();
  @Output() Stream<bool> get onChangeCheckStatus => _onChangeCheckStatusStream.stream;

  bool checked;
  bool isCompleted() {
    return complete.isNotEmpty;
  }

  onChangeCheck(Event e) {
    var target = e.target as InputElement;
    _onChangeCheckStatusStream.add(target.checked);
  }


  void ngOnInit() {
    this.checked = isCompleted();
  }

  // http://blog.yuhiisk.com/archive/2016/05/02/angular2-lifecycle-hooks.html

  TaskComponent() {

  }
}
