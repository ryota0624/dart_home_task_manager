import 'package:angular/angular.dart';
import 'package:quickstart/src/task/task_list_component.dart';
import 'package:quickstart/src/task/task.dart';
import 'package:angular_router/angular_router.dart';
import 'package:quickstart/src/routes.dart';

abstract class PagingDate {
  final DateTime dateTime;
  String display();
  PagingDate(this.dateTime);
  String fragment(); // 将来 Enumから取りたい？
}

class AroundTaskList {
  final PagingDate next;
  final PagingDate prev;
  AroundTaskList(this.prev, this.next);
}

mixin RoutineTaskComponent implements OnActivate, UrlBuilder   {
  static const templateUrl = 'routine_task_component.html';
  static const directives = [TaskListComponent, routerDirectives, NgIf];

  DateTime dateTime;
  Routine routine;
  AroundTaskList aroundTaskList;

  AroundTaskList getAroundTaskList(DateTime dateTime);

  @override
  void onActivate(_, RouterState current) async {
    try {
      var datetimeStr = current.parameters["datetime"];
      dateTime = DateTime.parse(datetimeStr);
      aroundTaskList = getAroundTaskList(dateTime);
    } catch (e) {
      print(e);
    }
  }
}

class DailyPagingDate extends PagingDate {
  DailyPagingDate(DateTime dateTime) : super(dateTime);

  String display() {
    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }
  String fragment() => "daily";
}

@Component(
    selector: 'daily-task-list',
    templateUrl: RoutineTaskComponent.templateUrl,
    directives: RoutineTaskComponent.directives)
class DailyTaskComponent with RoutineTaskComponent, UrlBuilder {
  Routine routine = Routine.Daily;

  AroundTaskList getAroundTaskList(DateTime dateTime) {
    return AroundTaskList(DailyPagingDate(dateTime.add(Duration(days: 1))),
        DailyPagingDate(dateTime.add(Duration(days: -1))));
  }
}

class WeeklyPagingDate extends PagingDate {
  WeeklyPagingDate(DateTime dateTime) : super(dateTime);

  String display() {
    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }

  String fragment() => "weekly";
}

@Component(
    selector: 'weekly-task-list',
    templateUrl: RoutineTaskComponent.templateUrl,
    directives: RoutineTaskComponent.directives)
class WeeklyTaskComponent with RoutineTaskComponent, UrlBuilder {
  Routine routine = Routine.Weekly;

  AroundTaskList getAroundTaskList(DateTime dateTime) {
    return AroundTaskList(
      WeeklyPagingDate(dateTime.add(Duration(days: 7))),
      WeeklyPagingDate(dateTime.add(Duration(days: -7))),
    );
  }
}


class MonthlyPagingDate extends PagingDate {
  MonthlyPagingDate(DateTime dateTime) : super(dateTime);

  String display() {
    return "${dateTime.year}/${dateTime.month}";
  }

  String fragment() => "monthly";
}

@Component(
    selector: 'monthly-task-list',
    templateUrl: RoutineTaskComponent.templateUrl,
    directives: RoutineTaskComponent.directives)
class MonthlyTaskComponent with RoutineTaskComponent, UrlBuilder {
  Routine routine = Routine.Monthly;

  AroundTaskList getAroundTaskList(DateTime dateTime) {
    return AroundTaskList(
      MonthlyPagingDate(dateTime.add(Duration(days: 30))),
      MonthlyPagingDate(dateTime.add(Duration(days: -30))),
    );
  }
}
