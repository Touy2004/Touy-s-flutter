import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class MainController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await fetchAlbums();
  }

  login(phone, password) async {
    try {
      var body = {"phone": phone, "password": password};

      var response = await http.post(
          Uri.parse("http://192.168.195.1:5000/api/user/login"),
          body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(response.body);
      }
      print(response.body);
    } catch (e) {
      print("error login ${e}");
    }
  }

  Future<Album> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = jsonDecode(response.body);
      print(data);
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
