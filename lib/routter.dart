import 'package:get/get.dart';
import 'package:myapp/page/home.dart';
import 'package:myapp/page/login.dart';

route() => [
      GetPage(name: '/home', page: () => HomePage()),
      GetPage(name: '/login', page: () => Login())
    ];
