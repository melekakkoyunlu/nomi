import 'package:flutter/material.dart';
import 'package:demo/src/features/map/screens/home/widgets/user_location_widget.dart';
import 'package:demo/src/features/other/screens/bookmarks/bookmarks_screen.dart';
import 'package:demo/src/features/other/screens/profile/profile_screen.dart';
import 'package:demo/src/features/map/screens/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:latlong2/latlong.dart';

import '../../models/place.dart'; // Ensure this import is available

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  // List to store bookmarks
  final List<Place> _bookmarks = [];

  // Add a place to bookmarks if it doesn't exist
  void _addToBookmarks(Place place) {
    if (!_bookmarks.any((p) => p.id == place.id)) {
      setState(() {
        _bookmarks.add(place);
      });
    }
  }

  // Screens with shared data
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      ProfileScreen(),
      UserLocationWidget(
        onAddToBookmarks: _addToBookmarks, // Pass the add function to UserLocationWidget
      ),
      BookmarksScreen(
        bookmarks: _bookmarks, // Share the bookmarks list
      ),
    ];
  }

  // Handle bottom navigation bar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
