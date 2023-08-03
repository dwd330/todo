import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/database/local_DB/collections/todo.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/view/widgets/gradient_button.dart';
import 'package:todo/view/widgets/text_input.dart';

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
          Container(
            margin: EdgeInsets.only(right: 40.w),
            padding: const EdgeInsets.all(12),
            child: const TextInputWidget(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: "NEW TASK",
                color: Colors.black),
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
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 3.w,
            runSpacing: 2.h,
            direction: Axis.horizontal,
            children: List.generate(
              6,
              (index) => InkWell(
                onTap: () => controller.colorindex = index,
                child: CircleAvatar(
                    maxRadius: 12.sp,
                    backgroundColor: controller.colorslist[index]),
              ),
            ),
          ),
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
                    text: controller.selecteddate.value.toString(),
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
                    text: controller.selectedtime.value.toString(),
                    color: Colors.black)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30.w),
            padding: EdgeInsets.only(top: 6.h),
            child: Gradientbutton(
              width: 36.w,
              height: 7.h,
              fontsize: 15.sp,
              onPressed: () {
                final todo = Todo()
                  ..name = controller.nametextcontroller.text
                  ..descripion = controller.discrepitiontextcontroller.text
                  ..color = ColorPalette.values[controller.colorindex]
                  ..date = controller.selecteddate.value
                  ..time = controller.selectedtime.value
                  ..stuts = StutusType.undone;
                controller.addTodo(todo);

                controller.nametextcontroller.clear();
                controller.discrepitiontextcontroller.clear();
                Get.back();
              },
              textvalue: "Add",
            ),
          )
        ],
      );
}
