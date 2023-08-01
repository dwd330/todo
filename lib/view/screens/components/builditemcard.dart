import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../database/local_DB/collections/todo.dart';
import '../../../logic/controllers/main_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';

Widget buildUserCard({
  required Todo item,
  required Function() onTap,
  required MainController mainController,
}) {
  return Align(
    child: AspectRatio(
      aspectRatio: 3.1 / 4.1,
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.sp),
                color: const Color.fromRGBO(255, 255, 255, 1),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 4, 44, 201).withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.mainscreen, arguments: item);
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Hero(
                          tag: item.id,
                          //TODO:: fix this
                          child: Container()),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4.sp),
                      child: Container(
                        color: bgcolorlite,
                        child: SizedBox(
                          width: double.infinity,
                          height: 5.h,
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Center(
                                    child: Text(
                                      item.name!,
                                      style: TextStyle(
                                        fontSize: 7.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "  ",
                            style: TextStyle(
                              fontSize: 5.sp,
                            ),
                          ),
                          TextSpan(
                            text: "EGP",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
