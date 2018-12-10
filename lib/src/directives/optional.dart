import 'package:angular/core.dart';
import 'package:quiver/core.dart' as quiver;

@Directive(selector: '[optionalSome]')
class OptionalSomeDirective {
  quiver.Optional value;
}
