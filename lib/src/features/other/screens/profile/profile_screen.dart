import 'package:demo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(tProfile, style: TextStyle(fontSize: 24)),
    );
  }
}
