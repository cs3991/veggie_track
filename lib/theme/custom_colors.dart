import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  CustomColors({
    required this.meatColor,
    required this.veggieColor,
    required this.veganColor,
  });

  final Color meatColor;
  final Color veggieColor;
  final Color veganColor;

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      meatColor: meatColor,
      veggieColor: veggieColor,
      veganColor: veganColor,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      meatColor: Color.lerp(meatColor, other.meatColor, t) ?? meatColor,
      veggieColor: Color.lerp(veggieColor, other.veggieColor, t) ?? veggieColor,
      veganColor: Color.lerp(veganColor, other.veganColor, t) ?? veganColor,
    );
  }
}
