import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../logic/controllers/main_controller.dart';
import '../../../../routes/routes.dart';
import 'build_todo_card.dart';

class ListTodos extends StatelessWidget {
  ListTodos({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.fliterList.isEmpty &&
              controller.textcontroller.text.isNotEmpty
          ? Container(
              color: Colors.white,
              child: const Icon(
                Icons.info_sharp,
                color: Colors.black,
              ),
            )
          : controller.todoList.isEmpty
              ? Center(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.mainscreen),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        primary: true,
                        itemCount: controller.fliterList.isEmpty
                            ? controller.todoList.length
                            : controller.fliterList.length,
                        itemBuilder: (context, index) {
                          if (controller.fliterList.isEmpty) {
                            return buildTodoCard(
                              todo: controller.todoList[index],
                              mainController: controller,
                              onTap: () {
                                print("tapped..");
                                Scaffold.of(context).openEndDrawer();
                                controller.openDrawer();
                              },
                            );
                          } else {
                            return buildTodoCard(
                                todo: controller.fliterList[index],
                                mainController: controller,
                                onTap: () {
                                  print("tapped...");
                                });
                          }
                        },
                      ),
                    ),
                  ),
                );
    });
  }
}
