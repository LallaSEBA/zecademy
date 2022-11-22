import 'package:assignment_zekademy/ui/theme.dart';
import 'package:flutter/material.dart';

import 'item_navigationbar.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 56,
      backgroundColor: ThemeConfig.colorItemRectgl,
      destinations: [
        ItemNavigationBar(img:'assets/images/Home.png',    index: 0, name: 'Home', ),
        ItemNavigationBar(img:'assets/images/Users.png',   index: 1, name: 'People', ),
        ItemNavigationBar(img:'assets/images/Plus.png',    index: 2, name: 'Create', ),
        ItemNavigationBar(img:'assets/images/Heart.png',   index: 3, name: 'Activities', ),
        ItemNavigationBar(img:'assets/images/Profile.png', index: 4, name: 'Profile', ),
    ],);
  }
}