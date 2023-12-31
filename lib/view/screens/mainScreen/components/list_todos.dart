import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/routes/routes.dart';
import 'package:todo/view/widgets/text_input.dart';

import 'build_todo_card.dart';

class ListTodos extends StatelessWidget {
  ListTodos({Key? key}) : super(key: key);

  final controller = Get.find<Appcontroller>();

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
                    child: const TextInputWidget(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        text: "tap the + icon to add new Todo",
                        color: Colors.black),
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
                              controller: controller,
                              onTap: () {
                                controller.toggleeditmode(true);
                                controller.settodo(controller.todoList[index]);
                                controller.openDrawer();
                              },
                            );
                          } else {
                            return buildTodoCard(
                                todo: controller.fliterList[index],
                                controller: controller,
                                onTap: () {
                                  controller.toggleeditmode(true);
                                  controller
                                      .settodo(controller.fliterList[index]);
                                  controller.openDrawer();
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
