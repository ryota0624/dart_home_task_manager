import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'package:quickstart/src/todo_list/todo_list_component.template.dart' as todo_list_template;
import 'package:quickstart/src/task/routine_task_component.template.dart' as routine_task_template;

export 'route_paths.dart';

class Routes {
  static final todos = RouteDefinition(
    routePath: RoutePaths.todos,
    component: todo_list_template.TodoListComponentNgFactory,
  );

  static final dailyTasks = RouteDefinition(
    routePath: RoutePaths.dailyTasks,
    component: routine_task_template.DailyTaskComponentNgFactory,
  );

  static final weeklyTasks = RouteDefinition(
    routePath: RoutePaths.weeklyTasks,
    component: routine_task_template.WeeklyTaskComponentNgFactory,
  );

  static final monthlyTasks = RouteDefinition(
    routePath: RoutePaths.monthlyTasks,
    component: routine_task_template.MonthlyTaskComponentNgFactory
  );

  static final all = <RouteDefinition>[
    todos,
    dailyTasks,
    weeklyTasks,
    monthlyTasks
  ];
}

mixin UrlBuilder {
  tasksUrl(String fragment, DateTime dateTime) => RoutePaths.tasksFragment(fragment).toUrl(parameters: {"datetime": dateTime.toIso8601String()});
  dailyTasksUrl(DateTime dateTime) => RoutePaths.dailyTasks.toUrl(parameters: {"datetime": dateTime.toIso8601String()});
  weeklyTasksUrl(DateTime dateTime) => RoutePaths.weeklyTasks.toUrl(parameters: {"datetime": dateTime.toIso8601String()});
  monthlyTasksUrl(DateTime dateTime) => RoutePaths.monthlyTasks.toUrl(parameters: {"datetime": dateTime.toIso8601String()});
}