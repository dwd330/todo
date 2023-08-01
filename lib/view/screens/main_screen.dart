import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../logic/controllers/main_controller.dart';
import '../widgets/floating_action_widget.dart';
import '../widgets/text_input.dart';
import 'components/Carditems.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = Get.find<MainController>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            CustomFliterIcon(
              ontap: () {
                print("tapped");
              },
            )
          ],
          elevation: 0,
          title: Center(
            child: TextInput(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                text: " TODO",
                color: Colors.black),
          ),
        ),
        floatingActionButton: const Floatingactionwidget(),
        body: Center(
            child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(187, 228, 232, 200),
              Color.fromARGB(196, 206, 182, 208),
              Color.fromARGB(150, 107, 167, 191)
            ],
          )),
          child: CardItems(),
        )),
      ),
    );
  }
}

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
