import 'package:quiver/core.dart';

mixin PrimitiveValueObject<T extends Object> {
  T value;

  String toString() {
    return value.toString();
  }

  bool operator==(other) {

    if (other is PrimitiveValueObject) {
      return other.value == this.value;
    }

    return false;
  }
}

class TaskName with PrimitiveValueObject<String> {
  final String value;
  TaskName(this.value);
}

enum Routine {
  Daily,
  Weekly,
  Monthly,
}

Optional<Routine> fromInt(int value) {
  try {
    return Optional.of(Routine.values
        .where((routine) => routine.index == value)
        .first);
  } catch(e) {
    return Optional.absent();
  }
}


class Task {
  final TaskName name;
  final Routine routine;
  Task(this.name, this.routine);
}


class TaskComplete {
  final TaskName name;
  final DateTime completedAt;
  TaskComplete(this.name, this.completedAt);
}