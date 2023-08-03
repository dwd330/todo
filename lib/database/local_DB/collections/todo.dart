import 'package:isar/isar.dart';
import 'package:todo/logic/controllers/app_controller.dart';
part 'todo.g.dart';

@collection
class Todo {
  Id id = Isar.autoIncrement;
  String? name;
  String? descripion;
  String? date;
  String? time;
  @enumerated
  StutusType stuts = StutusType.undone;
  @enumerated
  ColorPalette color = ColorPalette.cyan;
}
