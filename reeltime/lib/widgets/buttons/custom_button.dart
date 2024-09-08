import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reeltime/common/colors.dart';

class CustomButton extends StatelessWidget {
  Widget child;
  VoidCallback onTap;
  CustomButton({super.key, required this.child,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                            onTap: onTap,
                            child: Container(
                              height: 40.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(child: child)
                            ),
                          );
  }
}