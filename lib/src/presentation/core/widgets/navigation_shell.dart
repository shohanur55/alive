import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/widgets/home_bottom_navigation_bar.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.statefulNavigationShell});

  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.statefulNavigationShell,
      bottomNavigationBar: HomeBottomNavigationBar(
        activeIndex: widget.statefulNavigationShell.currentIndex,
        onIndexChanged: (index) {
          widget.statefulNavigationShell.goBranch(
            index,
            initialLocation:
                index == widget.statefulNavigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
