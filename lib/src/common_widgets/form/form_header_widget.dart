import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.2,),
        Text(title, style: Theme
            .of(context)
            .textTheme
            .headlineMedium),
        Text(subTitle, style: Theme
            .of(context)
            .textTheme
            .bodyMedium),
      ],
    );
  }
}
