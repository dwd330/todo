import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/view/widgets/button.dart';
import 'package:todo/view/widgets/text_input.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    super.key,
  });
  final controller = Get.find<Appcontroller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.sp),
              topRight: Radius.circular(30.sp))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextInputWidget(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              text: "fliter by color",
              color: Colors.black),
          colorlist(),
          const TextInputWidget(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              text: "fliter by date",
              color: Colors.black),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextInputWidget(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      text: "From",
                      color: Colors.blue),
                  TextInputWidget(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      text: "To",
                      color: Colors.blue),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      controller.pickdate();
                    },
                    child: Container(
                      width: 45.w,
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
                  TextButton(
                    onPressed: () {
                      controller.pickdate();
                    },
                    child: Container(
                      width: 45.w,
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
                ],
              ),
            ],
          ),
          AppButton(
              width: 35.w,
              height: 6.h,
              fontsize: 19,
              textvalue: "Apply",
              onPressed: () {
                Get.back();
              }),
        ],
      ),
    );
  }
}

colorlist() {
  return Wrap(
    spacing: 12.0,
    runSpacing: 12.0,
    children: <Widget>[
      CircleAvatar(
        maxRadius: 12.sp,
        backgroundColor: Colors.pinkAccent,
      ),
      CircleAvatar(
        maxRadius: 12.sp,
        backgroundColor: Colors.blueAccent,
      ),
      CircleAvatar(
        maxRadius: 12.sp,
        backgroundColor: Colors.purple,
      ),
      CircleAvatar(
        maxRadius: 12.sp,
        backgroundColor: Colors.blueGrey,
      ),
      CircleAvatar(
        maxRadius: 12.sp,
        backgroundColor: Colors.green,
      ),
      CircleAvatar(
        maxRadius: 12.sp,
        backgroundColor: Colors.amber,
      ),
    ],
  );
}
