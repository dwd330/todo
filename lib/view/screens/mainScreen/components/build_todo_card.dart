import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../../../database/local_DB/collections/todo.dart';
import '../../../../logic/controllers/main_controller.dart';
import '../../../widgets/text_input.dart';

Widget buildTodoCard({
  required Todo todo,
  required Function() onTap,
  required MainController mainController,
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
            backgroundColor: todo.color != null ? Colors.red : Colors.amber,
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
        trailing: dateandtime(todo),
      ),
    ),
  );
}

Column dateandtime(Todo todo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      TextInput(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          text: todo.date == null
              ? todo.date!
              : DateFormat("d MMM ").format(DateTime.now()),
          color: Colors.black),
      TextInput(
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
          text: todo.time != null
              ? todo.time!
              : DateFormat(" hh:mm a").format(DateTime.now()),
          color: Colors.black),
    ],
  );
}
