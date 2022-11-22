// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../config/config.dart';

class MainController extends GetxController {
  final box = GetStorage();
  login(phone, password) async {
    try {
      var body = {"phone": phone, "password": password};

      var response = await http.post(Uri.parse(LOGIN), body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(response.body);
        await setToken(data["token"]);
        Get.offAllNamed('/home');
        update();
      }
      print(response.body);
    } catch (e) {
      print("error login ${e}");
    }
  }

  register(firstname, lastname, phone, password, BuildContext context) async {
    try {
      var body = {
        "firstName": firstname,
        "lastName": lastname,
        "phone": phone,
        "password": password
      };

      var response = await http.post(Uri.parse(REGISTER), body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(response.body);
        await setToken(data["token"]);
        Get.offAllNamed('/home');
        update();
      }
      print(response.body);
    } catch (e) {
      print("error register ${e}");
    }
  }

  setToken(token) async {
    try {
      await box.write("token", token);
    } catch (e) {
      print("error token ${e}");
    }
  }
}
