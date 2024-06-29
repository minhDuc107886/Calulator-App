import 'package:flutter/material.dart';

class CaculatorApp extends StatefulWidget {
  const CaculatorApp({super.key});

  @override
  State<CaculatorApp> createState() => _CaculatorAppState();
}

class _CaculatorAppState extends State<CaculatorApp> {
  var InputValue = "";
  var Value = "";

  final List<String> buttons = [
    "C", "%", "delete", "+",
    "7", "8", "9", "-",
    "4", "5", "6", "x",
    "1", "2", "3", "/",
    "x-but","0", "." , "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // toolbarHeight: 5,
        title: Center(child: Text("Caculator App - Minh Đức")),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "RAD",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey
                          ),
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_vert)
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
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
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            Value,
                            style: const TextStyle(
                              fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  )
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
                      if (index ==0){
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              InputValue = '';
                              Value = '0';
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[50],
                          textColor: Colors.black,
                        );
                      }
                      else if (index == 1){

                      }
                    },

                  )
              )
            ],
        ),
      )
    );
  }
}
