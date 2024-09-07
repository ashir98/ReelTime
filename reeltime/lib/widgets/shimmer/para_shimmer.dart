import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerParagraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[700]!,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 1),
                height:  12.0, // Adjust the height according to your needs
                width: index==0? 50 : double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[700]!,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
