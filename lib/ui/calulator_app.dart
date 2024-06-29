import 'package:flutter/material.dart';

class CaculatorApp extends StatefulWidget {
  const CaculatorApp({super.key});

  @override
  State<CaculatorApp> createState() => _CaculatorAppState();
}

class _CaculatorAppState extends State<CaculatorApp> {
  var Input = "";
  var value = "";

  final List<String> buttons = [
    "C",
    "%",
    "delete",
    "+",
    "-",
    "x",
    "/",
    "=",
    "0","1","2","3","4","5","6","7","8","9",
    "other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // toolbarHeight: 5,
        title: Center(child: Text("Caculator App - Minh Đức")),
      ),
      body: Column(

      )
    );
  }
}
