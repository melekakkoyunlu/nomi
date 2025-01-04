import 'package:demo/src/constants/colors.dart';
import 'package:demo/src/constants/image_strings.dart';
import 'package:demo/src/constants/sizes.dart';
import 'package:demo/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tAccentColor : tPrimaryColor,
      body:Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(tWelcomeScreenImage),height: height * 0.60),
            Column(
              children: [
                Text(tWelcomeTitle, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                Text(tWelcomeSubTitle,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              ],
            ),
            Row(
              children: [
                Expanded(child: OutlinedButton(
                    onPressed: (){},
                    child: Text(tLogin)
                ),
                ),
                SizedBox(width: 20.0),
                Expanded(child: ElevatedButton(
                    onPressed: (){},
                    child: Text(tSign)
                ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}