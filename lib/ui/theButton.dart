import 'package:flutter/material.dart';

class TheButton extends StatelessWidget {

  final color;
  final textColor;
  final buttonText;
  final buttontapped;

  const TheButton({this.color, this.textColor, this.buttonText, this.buttontapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: hasImageIcon(buttonText) ? Container(
                child: Image(
                  width: 20,
                    image: AssetImage(
                        getImagePath(buttonText)
                    ),
                    color: Colors.lightBlueAccent
                ),
              )
              :Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ),
        ),
      ),
    );
  }
}

bool hasImageIcon(String x) {
  if (x == "exchange" || x == 'delete' || x == '/' || x == 'x' || x == '-' || x == '+') {
    return true;
  }
  return false;
}

String getImagePath(String buttonText) {
  if (buttonText == 'delete') {
    return 'lib/Image/delete.png';
  }
  else if (buttonText == '/') {
    return 'lib/Image/divide.png';
  }
  else if (buttonText == 'x') {
    return 'lib/Image/multiplication.png';
  }
  else if (buttonText == '+') {
    return 'lib/Image/addition.png';
  }
  else if (buttonText == '-') {
    return 'lib/Image/subtract.png';
  }
  else{
    return "lib/Image/exchange.png";
    }
}