import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:reeltime/provider/app_notifier.dart';
import 'package:reeltime/screens/auth/signup.dart';
import 'package:reeltime/screens/splash.dart';
import 'package:reeltime/theme/dark_theme.dart';
import 'package:reeltime/theme/light_theme.dart';

class ReelTime extends StatelessWidget {
  const ReelTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNotifier(),
      child: ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: "ReelTime",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: SignUpScreen(),
      ),
    ),
    );
  }


  
}