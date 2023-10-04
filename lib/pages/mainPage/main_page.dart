import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:cupertino_icons/cupertino_icons.dart";
import 'package:hse_app/pages/homepage/home_Page.dart';

import '../../data/permitItems.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    HomePage(
      heading: 'Choose the Work Permit',
      permitItems: permitItems.toList(),
    ),
    HomePage(
      heading: 'Inform The Hazard',
      permitItems: permitItems_report.toList(),
    ),
    HomePage(
      heading: 'Monitor The Hazard',
      permitItems: permitItems_monitor.toList(),
    ),
    HomePage(),
    // QRCodeScanner(),
    // HomePage(),
    // CartPage(),
    // MapPage()
  ];
  final _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Color.fromRGBO(14, 150, 157, 1),
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        height: 60,
        animationDuration: const Duration(milliseconds: 600),
        animationCurve: Curves.easeInOut,
        index: index,
        items: const [
          Icon(
            Icons.work,
            size: 30,
          ),
          Icon(
            Icons.monitor_heart_outlined,
            size: 30,
          ),
          Icon(
            Icons.report,
            size: 30,
          ),
          // Icon(Icons.shopping_cart_checkout, size: 30,),
          Icon(
            CupertinoIcons.tree,
            size: 30,
          )
        ],
        onTap: (index) => setState(() {
          this.index = index;
        }),
        letIndexChange: (index) => true,
      ),
    );
  }
}
