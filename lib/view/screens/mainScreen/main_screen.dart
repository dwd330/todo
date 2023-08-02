import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../logic/controllers/main_controller.dart';
import '../../widgets/custom_flitericon.dart';
import '../../widgets/drawer.dart';
import '../../widgets/floating_action_widget.dart';
import '../../widgets/text_input.dart';
import 'components/list_todos.dart';

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
        key: controller.scaffoldKey,
        endDrawer: CustomDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          actions: [
            CustomFliterIcon(
              ontap: () {
                Get.bottomSheet(BottomSheetWidget());
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
        floatingActionButton: Floatingactionwidget(
          onPressed: () {
            controller.openDrawer();
          },
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(186, 228, 231, 206),
              Color.fromARGB(196, 229, 198, 232),
              Color.fromARGB(146, 167, 172, 230)
            ],
          )),
          child: ListTodos(),
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    super.key,
  });
  final controller = Get.find<MainController>();

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
          const TextInput(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              text: "fliter by color",
              color: Colors.black),
          colorlist(),
          const TextInput(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              text: "fliter by date",
              color: Colors.black),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  controller.pickdate();
                },
                child: Container(
                  width: 40.w,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: ListTile(
                    trailing: const Icon(Icons.arrow_drop_down),
                    title: Obx(() => TextInput(
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
                  width: 40.w,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: ListTile(
                    trailing: const Icon(Icons.arrow_drop_down),
                    title: Obx(() => TextInput(
                        fontSize: 19,
                        fontWeight: FontWeight.w200,
                        text: controller.selecteddate.value.toString(),
                        color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('apply'),
          ),
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
