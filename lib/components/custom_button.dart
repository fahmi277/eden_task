import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_eden_farm/components/custom_text.dart';

class CustomButton extends StatelessWidget {
  Function onPressed;
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = Colors.black,
      required this.fontSize,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: CustomText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontColor: color,
      ),
      // onPressed: onPressed,
      onPressed: () {
        onPressed();
        if (kDebugMode) {
          print("clicked");
        }
      },
    );
  }
}
