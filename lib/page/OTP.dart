import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OTP extends StatefulWidget {
  final String phone;
  const OTP({Key? key, required this.phone}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    widget.phone;
    return Scaffold();
  }
}
