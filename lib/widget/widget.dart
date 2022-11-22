import 'package:flutter/material.dart';

void showDialogbox(context, String title) {
  showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
            title: Column(children: [
              Icon(Icons.error, color: Colors.red, size: 50),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18),
              )
            ]),
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "ok",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              )
            ],
          ));
}
