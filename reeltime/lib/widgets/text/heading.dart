import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/app.dart';

class HeadingText extends StatelessWidget {
  String? text;
  double fontSize;

  HeadingText(this.text, {super.key, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(fontSize: fontSize.sp, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
    );
  }
}
