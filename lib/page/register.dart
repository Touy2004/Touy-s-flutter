import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/main_controller.dart';
import 'package:myapp/page/OTP.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  width: 120,
                  height: 120,
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  controller: firstname,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Firstname is require";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your FirstName",
                      labelText: "FirstName",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  controller: lastname,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Lastname is require";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your LastName",
                      labelText: "LastName",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Your phone number is require";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "20XXXXXXXX",
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
                      return "Your password is require";
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
                TextFormField(
                  controller: confirm,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Please confirm your password";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Confirm your password",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        // controller.register(firstname.text, lastname.text,
                        //     phone.text, password.text, context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return OTPPage(firstName: firstname.text, lastName: lastname.text, phone: phone.text, password: password.text);
                        }));
                      }
                    },
                    child: Text("Next"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
