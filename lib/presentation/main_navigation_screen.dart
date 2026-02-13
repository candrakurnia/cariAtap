import 'package:cari_atap/presentation/favorite_feature/favorite_screen.dart';
import 'package:cari_atap/presentation/home_feature/home_screen.dart';
import 'package:cari_atap/presentation/message_feature/message_screen.dart';
import 'package:cari_atap/presentation/more_feature/more_screen.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(name: ""),
    const FavoriteScreen(),
    const MessageScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CrystalNavigationBar(
        backgroundColor: Colors.white.withValues(alpha: 0.2),
        currentIndex: _currentIndex,
        borderWidth: 2,
        outlineBorderColor: Color(0xDF736256),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home_rounded,
            selectedColor: Color(0xDF736256),
            unselectedColor: Colors.blueGrey[600],
          ),
          CrystalNavigationBarItem(
            icon: Icons.favorite_rounded,
            selectedColor: Colors.red,
            unselectedColor: Colors.blueGrey[600],
            // label: 'Favorites',
          ),
          CrystalNavigationBarItem(
            icon: Icons.chat_bubble_rounded,
            selectedColor: Color(0xDF736256),
            unselectedColor: Colors.blueGrey[600],
            // label: 'Messages',
          ),
          CrystalNavigationBarItem(
            icon: Icons.more_horiz_rounded,
            selectedColor: Color(0xDF736256),
            unselectedColor: Colors.blueGrey[600],
            // label: 'More',
          ),
        ],
      ),
    );
  }
}
