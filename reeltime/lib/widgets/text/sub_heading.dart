import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/app.dart';

class SubHeadingText extends StatelessWidget {
  String? text;
  double fontSize;
  TextOverflow? textOverflow;

  SubHeadingText(this.text,{super.key, this.fontSize = 14, this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text?? "",
      style: TextStyle(fontSize: fontSize.sp, color: Colors.grey, overflow:textOverflow),
    );
  }
}
