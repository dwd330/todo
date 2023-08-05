import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/services/database/local_stoarge/getstoarge.dart';

import 'routes/routes.dart';
import 'services/notifcation_service/notification_services.dart';
import 'utils/theme.dart';

// Sets a platform override for desktop to avoid exceptions. See
void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await NotificationService.initializeNotification();
  enablePlatformOverrideForDesktop();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GetStorageServices().readusertoken() !=
                null // if user already login go to main screen and skip login
            ? AppRoutes.mainscreen
            : AppRoutes.startscreen,
        getPages: AppRoutes.routes,
        theme: ThemesApp.light,
      );
    });
  }
}
