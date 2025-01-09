import 'package:demo/src/features/map/screens/home/widgets/user_location_widget.dart';
import 'package:demo/src/features/other/screens/bookmarks/bookmarks_screen.dart';
import 'package:demo/src/features/other/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/src/features/map/screens/home/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    ProfileScreen(),
    UserLocationWidget(),
    BookmarksScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
