import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'TheButton.dart';

class CaculatorApp extends StatefulWidget {
  const CaculatorApp({super.key});

  @override
  State<CaculatorApp> createState() => _CaculatorAppState();
}

class _CaculatorAppState extends State<CaculatorApp> {
  var InputValue = "0";
  var Value = "0";

  final List<String> buttons = [
    "C", "%", "delete", "+",
    "7", "8", "9", "-",
    "4", "5", "6", "x",
    "1", "2", "3", "/",
    "exchange", "0", ".", "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Text("Caculator App - Minh Đức")),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "RAD",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert)
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        InputValue,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,

                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        Value,
                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      //  C - clear
                      if (index == 0) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TheButton(
                            buttontapped: () {
                              setState(() {
                                InputValue = '';
                                Value = '0';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.white,
                            textColor: Colors.lightBlueAccent,
                          ),
                        );
                      }
                      // % button
                      else if (index == 1) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TheButton(
                            buttontapped: () {
                              setState(() {
                                InputValue += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.white,
                            textColor: Colors.lightBlueAccent,
                          ),
                        );
                      }
                      // delete
                      else if (index == 2) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TheButton(
                            buttontapped: () {
                              setState(() {
                                InputValue =
                                    InputValue.substring(
                                        0, InputValue.length - 1);
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.white,
                            textColor: Colors.lightBlueAccent,
                          ),
                        );
                      }
                      else if (index == 19) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TheButton(
                            buttontapped: () {
                              setState(() {
                                equalButtonPressed();
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.lightBlueAccent,
                            textColor: Colors.white,
                          ),
                        );
                      }
                      else {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TheButton(
                            buttontapped: () {
                              setState(() {
                                InputValue += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.white,
                            textColor: isOperator(buttons[index])
                                ? Colors.lightBlueAccent
                                : Colors.grey,
                          ),
                        );
                      }
                    },

                  )
              )
            ],
          ),
        )
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalButtonPressed() {
    String TheInput = InputValue;
    TheInput = InputValue.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(TheInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    Value = eval.toString();
  }

}