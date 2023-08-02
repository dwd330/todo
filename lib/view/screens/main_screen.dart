import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/main_controller.dart';
import '../widgets/custom_flitericon.dart';
import '../widgets/floating_action_widget.dart';
import '../widgets/text_input.dart';
import 'components/list_todos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.find<MainController>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            CustomFliterIcon(
              ontap: () {
                print("tapped");
              },
            )
          ],
          elevation: 0,
          title: Center(
            child: TextInput(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                text: " TODO",
                color: Colors.black),
          ),
        ),
        floatingActionButton: const Floatingactionwidget(),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(186, 228, 231, 206),
              Color.fromARGB(196, 229, 198, 232),
              Color.fromARGB(146, 167, 172, 230)
            ],
          )),
          child: ListTodos(),
        ),
      ),
    );
  }
}
