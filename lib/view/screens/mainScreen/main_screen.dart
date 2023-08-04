import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/view/widgets/bottom_sheet_widget.dart';
import 'package:todo/view/widgets/custom_drawer.dart';
import 'package:todo/view/widgets/custom_flitericon.dart';
import 'package:todo/view/widgets/floating_action_widget.dart';
import 'package:todo/view/widgets/text_input.dart';

import 'components/list_todos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.find<Appcontroller>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldKey,
        endDrawer: CustomDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            CustomFliterIcon(
              ontap: () {
                Get.bottomSheet(BottomSheetWidget());
              },
            )
          ],
          elevation: 0,
          title: Center(
            child: TextInputWidget(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                text: " TODO",
                color: Colors.black),
          ),
        ),
        floatingActionButton: Floatingactionwidget(
          onPressed: () {
            controller.toggleeditmode(false);
            controller.openDrawer();
          },
        ),
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
