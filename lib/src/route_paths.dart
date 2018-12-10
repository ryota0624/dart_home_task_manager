
import 'package:angular_router/angular_router.dart';

const datetimeParam = "datetime";

class RoutePaths {
  static final todos = RoutePath(path: 'todos');
  static final tasks = RoutePath(path: 'tasks');

  static RoutePath tasksFragment (String routine) => RoutePath(path: '${tasks.path}/${routine}/:$datetimeParam');
  static final RoutePath dailyTasks = tasksFragment("daily");
  static final RoutePath weeklyTasks = tasksFragment("weekly");
  static final RoutePath monthlyTasks = tasksFragment("monthly");

}