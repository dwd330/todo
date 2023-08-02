import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBackground extends StatelessWidget {
  final Widget widget;
  const CustomBackground({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Container(
              height: 33.h,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(157, 199, 231, 242),
                  Color.fromARGB(159, 199, 207, 228),
                ],
              )),
            ),
            ClipPath(
              clipper: BezierClipper(),
              child: Container(
                height: 33.h,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(121, 237, 215, 235),
                    Color.fromARGB(104, 223, 187, 223),
                  ],
                )),
              ),
            ),
            widget,
          ],
        ));
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.5, 0);

    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.5, size.width * 0.25, size.height);

    path.quadraticBezierTo(
        size.width * 1, size.height * 1, size.width * 1, size.height * 1);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
