import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'collections/todo.dart';

class Isarserives {
  //constructor
  late Future<Isar> db;
  Isarserives() {
    db = openDB();
  }

//openDB
  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        TodoSchema,
      ], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  //crud operations (Todo):
  Future<void> savetodo(Todo newtodo) async {
    final isar = await db;
    final todos = isar.todos;
    isar.writeTxnSync(() => todos.putSync(newtodo));
  }

  Future<void> updatetodo(Todo todo) async {
    final isar = await db;
    final todos = isar.todos;
    isar.writeTxnSync(() => todos.putSync(todo));
  }

  Future<void> deltodo(Todo todo) async {
    final isar = await db;
    final todos = isar.todos;
    await isar.writeTxn(() async {
      await todos.delete(todo.id);
    });
  }

  Future<List<Todo>> getalltodo() async {
    final isar = await db;
    final todos = isar.todos;
    final alltodos = await todos.where().findAll();
    return alltodos;
  }
}
