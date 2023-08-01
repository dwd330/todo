import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() async {
    super.onInit();
    loadTodos();
  }

  @override
  void dispose() {
    super.dispose();
    textcontroller.dispose();
  }

  final TextEditingController textcontroller = TextEditingController();

  void loadTodos() async {
    //todos reload
    var todos = await Isarserives().getalltodo();
    if (todos.isNotEmpty) {
      todoList.clear();
      todoList.addAll(todos);
    }
  }

//isar crud operation (item)=> inventory
  Future addItem(Todo newitem) async {
    await Isarserives().savetodo(newitem);
    loadTodos();
  }

  void deleteItem(Todo item) async {
    await Isarserives().deltodo(item);
    loadTodos();
  }

  Future editItem(Todo item) async {
    await Isarserives().updatetodo(item);
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
