import 'package:filter101/features/favorites/favorites_screen.dart';
import 'package:filter101/features/home/presentation/page/home.dart';
import 'package:filter101/features/info/info_screen.dart';
import 'package:filter101/features/onboarding/presentation/page/onboarding.dart';
import 'package:filter101/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colour.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const FavoritesTab(),
    const InfoTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colour.hunterGreen,
        // backgroundColor: Colors.green,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            icon: Icon(
              Icons.home,
              color: Colour.hunterGreen,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            icon: Icon(
              Icons.favorite,
              color: Colour.hunterGreen,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colour.hunterGreen,
            ),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colour.hunterGreen,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoritesScreen();
  }
}

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: InfoScreen(),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
  }
}
