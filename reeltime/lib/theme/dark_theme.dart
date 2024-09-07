import 'package:flutter/material.dart';
import 'package:reeltime/common/colors.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: "Roboto",
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.black,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
  ),


  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // General text style
    bodyMedium: TextStyle(color: Colors.white), // Secondary text style
  ),



   colorScheme: ColorScheme.dark(
    primary: AppColors.primaryColor, // Primary color set to blue
    onPrimary: Colors.white,
    surface: Colors.black,
  
  ),

  

  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey.shade900.withOpacity(0.3),
    filled: true,
    
    
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none
    ),
    



    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        
        color: AppColors.primaryColor
      )
    )
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primaryColor),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black
  ),

  listTileTheme: ListTileThemeData(
    textColor: Colors.white
  ),



);