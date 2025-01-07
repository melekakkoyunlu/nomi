import 'package:demo/src/features/map/screens/home/widgets/user_location_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeScreen',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: UserLocationWidget(),
    );
  }
}

