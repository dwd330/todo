import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/database/local_DB/collections/todo.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/view/widgets/text_input.dart';

Widget buildTodoCard({
  required Todo todo,
  required Function() onTap,
  required Appcontroller controller,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 9.sp, vertical: 4.sp),
    child: Card(
      child: ListTile(
        horizontalTitleGap: 1.w,
        onTap: onTap,
        leading: SizedBox(
          height: 5.h,
          child: CircleAvatar(
            maxRadius: 9.sp,
            backgroundColor: controller.colorslist[todo.color.index],
          ),
        ),
        subtitle: SizedBox(
          width: double.infinity,
          height: 8.h,
          child: Center(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: todo.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: " , ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: todo.descripion,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        trailing: dateandtime(todo, controller),
      ),
    ),
  );
}

Column dateandtime(Todo todo, Appcontroller controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      TextInputWidget(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          text: controller.shortformatdate(todo.date!),
          color: Colors.black),
      TextInputWidget(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          text: todo.time!,
          color: Colors.black),
    ],
  );
}
