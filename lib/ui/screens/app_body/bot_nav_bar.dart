import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/app_body/basket.dart';
import 'package:untitled/ui/screens/app_body/orders.dart';

import 'home_screen.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _currentIndex = 0;
  List items = [
    const HomeScreen(),
    const Basket(),
    const Order(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        showUnselectedLabels: true,
        iconSize: 26,
        selectedItemColor: const Color(0xff2D46B9).withOpacity(0.85),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Order',
          ),
        ],
      ),
    );
  }
}
