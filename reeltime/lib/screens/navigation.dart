import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:reeltime/provider/app_notifier.dart';
import 'package:reeltime/screens/home/home.dart';
import 'package:reeltime/screens/search/search.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});



  @override
  Widget build(BuildContext context) {
  var notifier = Provider.of<AppNotifier>(context);
    return PersistentTabView(
      
      context,


      
    
      
      
      
      isVisible: notifier.getIsBottombarVisible,
      
      screens: const [
        HomeScreen(),
        SearchScreen(),
        HomeScreen(),
      ],

      navBarHeight: 70,

      navBarStyle: NavBarStyle.style13,

      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,

      items: [
        PersistentBottomNavBarItem(
          inactiveColorPrimary:  Colors.grey.shade600,
          icon: const Icon(Iconsax.home_2_outline),
          title: "Home"
        ),
        PersistentBottomNavBarItem(
          inactiveColorPrimary: Colors.grey.shade600,
          icon: const Icon(Iconsax.search_normal_1_outline),
          title: "Search"
        ),
        PersistentBottomNavBarItem(
          inactiveColorPrimary : Colors.grey.shade600,
          icon: const Icon(Iconsax.video_horizontal_outline),
          title: "Upcoming"
        ),
      ],

    );
  }
}