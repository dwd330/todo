import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/controllers/main_controller.dart';
import '../../../routes/routes.dart';
import 'builditemcard.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.fliterList.isEmpty &&
              controller.textcontroller.text.isNotEmpty
          ? Container(
              color: Colors.white,
              height: 50.h,
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
                    height: 22.h,
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        primary: true,
                        itemCount: controller.fliterList.isEmpty
                            ? controller.todoList.length
                            : controller.fliterList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3.6 / 5.2,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          crossAxisCount: 5,
                        ),
                        itemBuilder: (context, index) {
                          if (controller.fliterList.isEmpty) {
                            return buildUserCard(
                              item: controller.todoList[index],
                              mainController: controller,
                              onTap: () {},
                            );
                          } else {
                            return buildUserCard(
                                item: controller.fliterList[index],
                                mainController: controller,
                                onTap: () {});
                          }
                        },
                      ),
                    ),
                  ),
                );
    });
  }
}
