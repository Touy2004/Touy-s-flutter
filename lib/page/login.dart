import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/main_controller.dart';
import 'package:myapp/page/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final phone = TextEditingController();
  final password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/images/login.png", width: 120, height: 120),
                Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phone,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Phone is require";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your phone",
                      labelText: "Phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  controller: password,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Password is require";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          controller.login(phone.text, password.text);
                        }
                      },
                      child: Text('Login')),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Register();
                      }));
                    },
                    child: Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
