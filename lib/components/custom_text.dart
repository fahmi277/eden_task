// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color fontColor;
  CustomText(
      {Key? key,
      required this.text,
      this.fontColor = Colors.black,
      required this.fontSize,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: fontWeight, fontSize: fontSize, color: fontColor),
    );
  }
}
