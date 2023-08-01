import 'package:isar/isar.dart';
part 'todo.g.dart';

@collection
class Todo {
  Id id = Isar.autoIncrement;
  String? name;
  String? descripion;
  String? color;
  String? date;
  String? time;
  String? stuts;
}
