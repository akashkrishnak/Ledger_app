import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'sec.dart';

void main() {
  runApp(MaterialApp(home: myApp()));
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromARGB(255, 26, 100, 160)),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    nextpage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    }

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 350),
            child: Text(
              "Pin Input",
              style: TextStyle(fontSize: 35, color: Colors.blue),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              validator: (s) {
                return s == '2222' ? nextpage() : "Pin is incorrect";
              },
            ),
          )
        ],
      )),
    );
  }
}
