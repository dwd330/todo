import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Floatingactionwidget extends StatelessWidget {
  const Floatingactionwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17.w,
      height: 8.h,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 171, 203, 235),
            Color.fromARGB(246, 38, 165, 229),
            Color.fromARGB(246, 38, 128, 172)
          ],
        ),
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
