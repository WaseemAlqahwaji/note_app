import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme.dart';

class KBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const KBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      unselectedItemColor: Colors.grey.shade400,
      enablePaddingAnimation: false,
      borderRadius: 20.0,
      selectedItemColor: KTheme.mainColor,
      currentIndex: currentIndex,
      onTap: onTap,
      dotIndicatorColor: Colors.black,
      items: [
        DotNavigationBarItem(icon: const Icon(Icons.home_filled)),
        DotNavigationBarItem(icon: const Icon(Icons.favorite)),
      ],
    );
  }
}
