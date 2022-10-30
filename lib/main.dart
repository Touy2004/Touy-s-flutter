import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/main_controller.dart';
import 'package:myapp/page/login.dart';

void main() {
  Get.lazyPut<MainController>(() => MainController());
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
      home: const Login(),
    );
  }
}
