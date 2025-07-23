import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/config/app_router.dart';

class MainNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const MainNavigationBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: (value) {
        context.go(bottomRoutes[value].path);
      },
      items: [
        ...bottomRoutes.map((route) {
          return BottomNavigationBarItem(
            icon: Icon(route.icon),
            label: route.name,
          );
        }),
      ],
    );
  }
}
