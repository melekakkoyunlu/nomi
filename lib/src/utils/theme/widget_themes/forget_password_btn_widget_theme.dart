import 'package:flutter/material.dart';

class ForgetPasswordButtonTheme extends ThemeExtension<ForgetPasswordButtonTheme> {
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  const ForgetPasswordButtonTheme({
    this.backgroundColor,
    this.iconColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  @override
  ForgetPasswordButtonTheme copyWith({
    Color? backgroundColor,
    Color? iconColor,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
  }) {
    return ForgetPasswordButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
    );
  }

  @override
  ForgetPasswordButtonTheme lerp(ThemeExtension<ForgetPasswordButtonTheme>? other, double t) {
    if (other is! ForgetPasswordButtonTheme) {
      return this;
    }
    return ForgetPasswordButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
      subtitleTextStyle: TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t),
    );
  }

  // Light Theme
  static const light = ForgetPasswordButtonTheme(
    backgroundColor: Color(0xFFF5F5F5),
    iconColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.black54,
      fontSize: 14,
    ),
  );

  // Dark Theme
  static const dark = ForgetPasswordButtonTheme(
    backgroundColor: Color(0xFF424242),
    iconColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.white70,
      fontSize: 14,
    ),
  );
}

