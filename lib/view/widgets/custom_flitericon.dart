import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFliterIcon extends StatelessWidget {
  final Function() ontap;
  const CustomFliterIcon({
    super.key,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(right: 3.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 5.w,
              height: 1.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(188, 225, 132, 70),
                      Color.fromARGB(175, 228, 86, 148),
                      Color.fromARGB(155, 216, 22, 22)
                    ],
                  )),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              width: 8.w,
              height: 1.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(188, 225, 132, 70),
                      Color.fromARGB(175, 228, 86, 148),
                      Color.fromARGB(155, 216, 22, 22)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
