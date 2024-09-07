import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reeltime/app.dart';
import 'package:shimmer/shimmer.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade900,
          highlightColor: Colors.grey.shade700,
          enabled: true,
        child: Card(
                    margin: EdgeInsets.all(5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,)
                    
      ));
  }
}