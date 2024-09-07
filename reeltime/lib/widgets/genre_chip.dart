import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/app.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.genreTitle});

  final String genreTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3).r,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade700,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        genreTitle,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
