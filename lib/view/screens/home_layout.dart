import 'package:flutter/material.dart';
import 'package:note_app/view/screens/dashboard_screen.dart';
import '../widgets/custom_bottom_nav.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> _screens =
  [
    DashBoardScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: KBottomNav(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          children: _screens,
        ),
      ),
    );
  }

  void _onBottomNavTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
        _pageController.jumpToPage(
          index,
        );
      });
    }
  }
}
