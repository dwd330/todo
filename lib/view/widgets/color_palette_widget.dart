import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/logic/controllers/app_controller.dart';

class ColorPaletteWidget extends StatelessWidget {
  ColorPaletteWidget({
    super.key,
  });

  final controller = Get.find<Appcontroller>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Wrap(
          alignment: WrapAlignment.center,
          spacing: 3.w,
          runSpacing: 2.h,
          direction: Axis.horizontal,
          children: List.generate(
            6,
            (index) => InkWell(
              onTap: () => controller.colorindex.value = index,
              child: CircleAvatar(
                maxRadius: controller.colorindex.value == index ? 15.sp : 12.sp,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                    maxRadius:
                        controller.colorindex.value == index ? 14.sp : 12.sp,
                    backgroundColor: controller.colorslist[index]),
              ),
            ),
          ),
        ));
  }
}
