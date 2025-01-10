import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavigationBarWidget({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_rounded),
          label: tProfile,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: tHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notes),
          label: tBookmarks,
        ),
      ],
    );
  }
}
