import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/database/local_DB/collections/todo.dart';
import 'package:todo/database/local_DB/isar_services.dart';
import 'package:todo/database/local_stoarge/getstoarge.dart';
import 'package:todo/database/remote_server/http_handler.dart';

enum StutusType { done, undone }

enum ColorPalette { pink, cyan, magenta, darkblue, green, yellow }

class Appcontroller extends GetxController {
  var todoList = <Todo>[].obs;
  var fliterList = <Todo>[].obs;

  //date and time (Todo)
  var selecteddate = DateTime.now().obs;
  var selectedtime = "".obs;
//fliter dates
  var startdate = DateTime.now().obs;
  var enddate = DateTime.now().obs;
  //color vars
  var colorindex = 0.obs;
  List<Color> colorslist = [
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.purple,
    Colors.blueGrey,
    Colors.green,
    Colors.amber,
  ];
//for update todo
  var selectedtodo = Todo().obs;
  var iseditmode = false.obs;
  var isdone = false.obs;
  @override
  void onInit() async {
    super.onInit();
    loadTodos();
  }

  @override
  void dispose() {
    super.dispose();
    textcontroller.dispose();
    nametextcontroller.dispose();
    discrepitiontextcontroller.dispose();
  }

  final TextEditingController textcontroller = TextEditingController();
  final TextEditingController nametextcontroller = TextEditingController();
  final TextEditingController discrepitiontextcontroller =
      TextEditingController();

//load stored Todos from local DB
  void loadTodos() async {
    //todos load from Local database
    var todos = await Isarserives().getalltodo();
    if (todos.isNotEmpty) {
      todoList.clear();
      todoList.addAll(todos);
    }
  }

//fliter Todos
  void fliterTodos({
    required var by,
    var filter,
  }) {
    //first make sure fliter list is clear
    fliterList.clear();
    //todos reload
    loadTodos();

//fliter by:
    switch (by) {
      case "color":
        try {
          fliterList.value = todoList.where((todo) {
            return todo.color.index == filter;
          }).toList();
        } catch (error) {
          throw ("Error on color flitering");
        }
        break;
      case "stutus":
        try {
          fliterList.value = todoList.where((todo) {
            return todo.stutus == filter;
          }).toList();
        } catch (error) {
          throw ("Error on stutus flitering");
        }
        break;
      case "date":
        try {
          if (startdate.value == enddate.value) {
            //no need to fliter
            break;
          }
          fliterList.value = todoList.where((todo) {
            return todo.date!.compareTo(startdate.value) >= 0 &&
                todo.date!.compareTo(enddate.value) <= 0;
          }).toList();
        } catch (error) {
          throw ("Error on date flitering");
        }
        break;
    }
  }

//isar crud operation (todo)
  Future addTodo(Todo newtodo) async {
    await Isarserives().savetodo(newtodo);
    loadTodos();
  }

  void deleteTodo(Todo todo) async {
    await Isarserives().deltodo(todo);
    loadTodos();
  }

  Future editTodo(Todo todo) async {
    await Isarserives().updatetodo(todo);
    loadTodos();
  }

//drawer helper
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
  }

//set todo (for drawer to update-delete)
//used to switch visiablitiy of widgets in drawer cuz we have on one end drawer

  void toggleeditmode(bool value) async {
    iseditmode.value = value;
  }

//for updating
  void settodo(Todo todo) async {
    selectedtodo.value = todo;
    nametextcontroller.text = todo.name!;
    discrepitiontextcontroller.text = todo.descripion!;
    selecteddate.value = todo.date!;
    selectedtime.value = todo.time!;
    colorindex.value = todo.color.index;
    isdone.value = todo.stutus == StutusType.done;
  }

  //clean data vars
  void cleandata() {
    //clear text controllers
    nametextcontroller.clear();
    discrepitiontextcontroller.clear();
    //reset controller date & time
    selecteddate.value = DateTime.now();
    selectedtime.value = "";
    colorindex.value = 0;
    isdone.value = false;
  }

//date and time picker

//show date picker
  void pickdate() async {
    DateTime? packedate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: "select task date",
      errorFormatText: "enter a valid date,please",
      fieldLabelText: "when would you like to start",
    );

    if (packedate != null) {
      selecteddate.value = packedate;
    }
  }

  Future<DateTime?> selectfliterdate() async {
    DateTime? packedate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      helpText: "select task date",
      errorFormatText: "enter a valid date,please",
      fieldLabelText: "How would you like to fliter",
    );

    if (packedate != null) {
      return packedate;
    }
    return null;
  }

//date formatter
  String formatdate(DateTime date) => DateFormat("dd MMM yyyy ").format(date);
  String shortformatdate(DateTime date) => DateFormat("dd MMM ").format(date);
//show time picker
  void picktime() async {
    TimeOfDay? packedtime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: "select task time",
    );

    if (packedtime != null) {
      selectedtime.value =
          '${packedtime.hour.toString().padLeft(2, '0')}:${packedtime.minute.toString().padLeft(2, '0')}';
    }
  }

//date diff
  int datediff(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inSeconds).round();
  }

//user management

  //handle login:
  Future<bool> isLoggedIn(
      {required String email, required String password}) async {
    //check if user already logged in
    if (GetStorageServices().readusertoken() != null) {
      return true;
    }
    //create new login and save session
    final user = await HttpHandler().login(email, password);
    if (user != null) {
      GetStorageServices().storeusertoken(user.data!.token!);
      return true;
    } else {
      return false;
    }
  }

  bool logout() {
    //clear getsorage usertoken
    GetStorageServices().clearusertoken();
    return true;
  }

  String? getusertoken() {
    return GetStorageServices().readusertoken();
  }
}
