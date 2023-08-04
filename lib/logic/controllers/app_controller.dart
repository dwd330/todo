import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../database/local_DB/Isar_services.dart';
import '../../database/local_DB/collections/todo.dart';
import '../../database/stoarge/getstoarge.dart';
import '../../models/user_model.dart';

enum StutusType { done, undone }

enum ColorPalette { pink, cyan, magenta, darkblue, green, yellow }

class Appcontroller extends GetxController {
  var usertoken = ""; //user loggedin
  var userList = <User>[].obs;
  var todoList = <Todo>[].obs;
  var fliterList = <Todo>[].obs;

  //date and time
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

  var selectedtodo = Todo().obs;
  var iseditmode = false.obs;
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
    //todos reload
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
  }

//date and time picker

//show date picker
  void pickdate() async {
    DateTime? packedate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
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
      fieldLabelText: "when would you like to start",
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
//user management

  //handle login:
  Future<bool> isLoggedIn(
      {required String username, required String password}) async {
//if userlist is empty return true
//search with username in userlist:
//the get the user
// match the password
//if it matches then set loggedin to true and save user in usertoken
    if (userList.isEmpty) return true; //no users yet
    List<User> result = userList
        .where((user) {
          var queryname = user.email.trim();
          var querypassword = user.password.trim();
          return ((queryname == username) && (querypassword == password));
        })
        .cast<User>()
        .toList();
    if (result.isNotEmpty) {
      GetStorageServices().storeusertoken("token");
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
