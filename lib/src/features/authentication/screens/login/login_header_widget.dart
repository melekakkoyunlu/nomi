import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tLoginScreenImage1),
          height: size.height * 0.2,
        ),
        Text(tLoginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(tLoginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
