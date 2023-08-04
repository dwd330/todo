import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/database/local_DB/collections/todo.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/services/notification_services.dart';
import 'package:todo/utils/theme.dart';
import 'package:todo/view/widgets/button.dart';
import 'package:todo/view/widgets/gradient_button.dart';
import 'package:todo/view/widgets/text_input.dart';

import 'color_palette_widget.dart';
import 'textfieldwidget.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final controller = Get.find<Appcontroller>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            bulidmenuitems(context),
          ],
        ),
      ),
    );
  }

  bulidmenuitems(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextInputWidget(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    text: controller.iseditmode.value
                        ? "Update Task"
                        : "NEW TASK",
                    color: Colors.black),
              ),
              Obx(() => Opacity(
                    opacity: controller.isdone.value ? 0.9 : 0.3,
                    child: AppButton(
                        width: 12.w,
                        height: 5.h,
                        fontsize: 15,
                        textvalue: "✔",
                        onPressed: () {
                          controller.isdone.value = !controller.isdone.value;
                          //toggle stutus
                          switch (controller.selectedtodo.value.stutus) {
                            case StutusType.done:
                              controller.selectedtodo.value.stutus =
                                  StutusType.undone;
                              break;
                            case StutusType.undone:
                              controller.selectedtodo.value.stutus =
                                  StutusType.done;
                              break;
                          }
                        }),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 57.w),
            padding: const EdgeInsets.all(10),
            child: const TextInputWidget(
                fontSize: 19,
                fontWeight: FontWeight.w200,
                text: "color ",
                color: Colors.black),
          ),
          SizedBox(height: 7.h, child: ColorPaletteWidget()),
          Container(
            margin: EdgeInsets.only(right: 57.w),
            padding: const EdgeInsets.only(top: 15),
            child: const TextInputWidget(
                fontSize: 19,
                fontWeight: FontWeight.w200,
                text: "Name",
                color: Colors.black),
          ),
          TextFieldWidget(
            controller: controller.nametextcontroller,
            text: 'task name',
            underline: true,
          ),
          Container(
            margin: EdgeInsets.only(right: 45.w),
            padding: const EdgeInsets.only(top: 15),
            child: const TextInputWidget(
                fontSize: 19,
                fontWeight: FontWeight.w200,
                text: "Description",
                color: Colors.black),
          ),
          TextFieldWidget(
            controller: controller.discrepitiontextcontroller,
            text: 'task Description',
            underline: false,
            maxlines: 4,
          ),
          Container(
            margin: EdgeInsets.only(right: 57.w),
            padding: const EdgeInsets.only(top: 15),
            child: const TextInputWidget(
                fontSize: 19,
                fontWeight: FontWeight.w200,
                text: "date",
                color: Colors.black),
          ),
          TextButton(
            onPressed: () {
              controller.pickdate();
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
              ),
              child: ListTile(
                trailing: const Icon(Icons.arrow_drop_down),
                title: Obx(() => TextInputWidget(
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    text: controller.formatdate(controller.selecteddate.value),
                    color: Colors.black)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 57.w),
            padding: const EdgeInsets.only(top: 15),
            child: const TextInputWidget(
                fontSize: 19,
                fontWeight: FontWeight.w200,
                text: "Time",
                color: Colors.black),
          ),
          TextButton(
            onPressed: () {
              controller.picktime();
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
              ),
              child: ListTile(
                trailing: const Icon(Icons.arrow_drop_down),
                title: Obx(() => TextInputWidget(
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    text: controller.selectedtime.value.isEmpty
                        ? "pick a time"
                        : controller.selectedtime.value,
                    color: Colors.black)),
              ),
            ),
          ),
          Obx(() => Visibility(
                visible: controller.iseditmode.value == false,
                child: Container(
                  margin: EdgeInsets.only(right: 30.w),
                  padding: EdgeInsets.only(top: 3.h),
                  child: Gradientbutton(
                    width: 36.w,
                    height: 7.h,
                    fontsize: 15.sp,
                    onPressed: () async {
                      //validate date
                      if (controller.nametextcontroller.text.isEmpty ||
                          controller.discrepitiontextcontroller.text.isEmpty ||
                          controller.selectedtime.value.isEmpty) {
                        Get.snackbar(
                          "warning",
                          "some data are missing,please fill your Todo detils",
                          backgroundGradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(251, 5, 25, 239),
                              Color.fromARGB(255, 103, 15, 111),
                            ],
                          ),
                          colorText: Colors.black,
                          icon: const Icon(
                            Icons.warning,
                            color: Colors.white,
                          ),
                          shouldIconPulse: true,
                          snackPosition: SnackPosition.TOP,
                          duration: const Duration(milliseconds: 2200),
                        );
                      } else {
                        //create Tod opject model
                        final todo = Todo()
                          ..name = controller.nametextcontroller.text
                          ..descripion =
                              controller.discrepitiontextcontroller.text
                          ..color =
                              ColorPalette.values[controller.colorindex.value]
                          ..date = controller.selecteddate.value
                          ..time = controller.selectedtime.value
                          ..stutus = StutusType.undone;

                        //add todo to local DB
                        controller.addTodo(todo);

                        //set noitication
                        await NotificationService.showNotification(
                            title: "reminder",
                            body: "your todo ${todo.name} time is soon",
                            scheduled: true,
                            interval: controller.datediff(
                                // get notification on the deadinle
                                DateTime.now(),
                                todo.date!));

                        //clean variables
                        controller.cleandata();

                        Get.back();
                      }
                    },
                    textvalue: "Add",
                  ),
                ),
              )),
          Obx(() => Visibility(
                visible: controller.iseditmode.value == true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 3.h),
                      child: AppButton(
                        width: 30.w,
                        height: 7.h,
                        style: style2,
                        fontsize: 15.sp,
                        onPressed: () {
                          controller.deleteTodo(controller.selectedtodo.value);

                          controller.nametextcontroller.clear();
                          controller.discrepitiontextcontroller.clear();
                          Get.back();
                        },
                        textvalue: "Delete",
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Gradientbutton(
                        width: 30.w,
                        height: 7.h,
                        fontsize: 15.sp,
                        onPressed: () {
                          //record changes
                          controller.selectedtodo.value.name =
                              controller.nametextcontroller.text;
                          controller.selectedtodo.value.descripion =
                              controller.discrepitiontextcontroller.text;
                          controller.selectedtodo.value.color =
                              ColorPalette.values[controller.colorindex.value];
                          controller.selectedtodo.value.date =
                              controller.selecteddate.value;
                          controller.selectedtodo.value.time =
                              controller.selectedtime.value;
                          //update
                          controller.editTodo(controller.selectedtodo.value);

                          //clean variables
                          controller.cleandata();
                          //return to home
                          Get.back();
                        },
                        textvalue: "update",
                      ),
                    ),
                  ],
                ),
              )),
        ],
      );
}
