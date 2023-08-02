import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/screens/mainScreen/components/build_todo_card.dart';
import '../../database/local_DB/Isar_services.dart';
import '../../database/local_DB/collections/todo.dart';
import '../../database/stoarge/getstoarge.dart';
import '../../models/userModel.dart';

enum DiscountType { percent, cash }

class MainController extends GetxController {
  var usertoken = ""; //user loggedin
  var userList = <User>[].obs;
  var todoList = <Todo>[].obs;
  var fliterList = <Todo>[].obs;
  var selecteddate = DateTime.now().obs;
  var selectedtime = TimeOfDay.now().obs;
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

  void loadTodos() async {
    //todos reload
    var todos = await Isarserives().getalltodo();
    if (todos.isNotEmpty) {
      todoList.clear();
      todoList.addAll(todos);
    }
  }

//isar crud operation (todo)
  Future addTodo(Todo newitem) async {
    await Isarserives().savetodo(newitem);
    loadTodos();
  }

  void deleteTodo(Todo item) async {
    await Isarserives().deltodo(item);
    loadTodos();
  }

  Future editTodo(Todo item) async {
    await Isarserives().updatetodo(item);
  }

//drawer helper
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
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

//show time picker
  void picktime() async {
    TimeOfDay? packedtime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: "select task time",
    );

    if (packedtime != null) {
      selectedtime.value = packedtime;
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
