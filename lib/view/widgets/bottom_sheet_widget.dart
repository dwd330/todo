import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/logic/controllers/app_controller.dart';
import 'package:todo/utils/theme.dart';
import 'package:todo/view/widgets/button.dart';
import 'package:todo/view/widgets/color_palette_widget.dart';
import 'package:todo/view/widgets/text_input.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    super.key,
  });
  final controller = Get.find<Appcontroller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
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
              fontWeight: FontWeight.w500,
              text: "fliter by color",
              color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7.h, child: ColorPaletteWidget()),
              AppButton(
                  width: 12.w,
                  height: 5.h,
                  fontsize: 15,
                  textvalue: "✔",
                  onPressed: () {
                    controller.fliterTodos(
                        by: "color", filter: controller.colorindex.value);
                    Get.back();
                  }),
            ],
          ),
          const TextInputWidget(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              text: "fliter by date",
              color: Colors.black),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextInputWidget(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      text: "From",
                      color: Colors.blue),
                  AppButton(
                      width: 22.w,
                      height: 5.h,
                      fontsize: 13,
                      textvalue: "Apply",
                      onPressed: () {
                        controller.fliterTodos(by: "date");
                        Get.back();
                      }),
                  const TextInputWidget(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      text: "To",
                      color: Colors.blue),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      final startdate = await controller.selectfliterdate();
                      if (startdate != null) {
                        controller.startdate.value = startdate;
                      }
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
                            text: controller
                                .formatdate(controller.startdate.value),
                            color: Colors.black)),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final enddate = await controller.selectfliterdate();
                      if (enddate != null) {
                        controller.enddate.value = enddate;
                      }
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
                            text:
                                controller.formatdate(controller.enddate.value),
                            color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppButton(
              width: 38.w,
              height: 6.h,
              fontsize: 16,
              style: style2,
              textvalue: "remove all   ✗",
              onPressed: () {
                controller.fliterTodos(by: "");
                Get.back();
              }),
        ],
      ),
    );
  }
}
