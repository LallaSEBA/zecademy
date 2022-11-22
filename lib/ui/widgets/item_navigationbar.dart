import 'package:assignment_zekademy/ui/people_screen.dart';
import 'package:assignment_zekademy/ui/theme.dart';
import 'package:flutter/material.dart';

class ItemNavigationBar extends StatelessWidget {
  String img;
  String name;
  int    index;
  ItemNavigationBar({super.key, required this.img, required this.index, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 39,
      child: GestureDetector(
        child: Column(
          children: [
            Image.asset(img),
            Text(name, style: index==1? ThemeConfig.txtStyleNavBarActv : ThemeConfig.txtStyleNavBar,)
          ],
        ),
        onTap: () {
          switch (index){
            case 1: Navigator.of(context).pushReplacementNamed(PeopleScreen.route);
          }
        },
      ),
    );
  }
}