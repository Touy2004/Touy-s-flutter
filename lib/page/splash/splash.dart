import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Check();
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 200),
                  child: Lottie.asset('assets/animation/logo.json')),
            ),
            Text('Loading...')
          ],
        ),
      ),
    );
  }

  Check() {
    if (box.read("token") == '' || box.read("token") == null) {
      Get.offNamed("/login");
    } else {
      Get.offNamed('/home');
    }
  }
}
