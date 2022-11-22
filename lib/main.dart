import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp/controller/main_controller.dart';
import 'package:myapp/page/login.dart';
import 'package:myapp/page/splash/splash.dart';
import 'package:myapp/routter.dart';

void main() async {
  Get.lazyPut<MainController>(() => MainController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "flutter course2",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.yellow),
      home: const SplashPage(),
      getPages: route(),
    );
  }
}
