import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.onMeat,
    required this.meatContainer,
    required this.onMeatContainer,
    required this.onVeggie,
    required this.veggieContainer,
    required this.onVeggieContainer,
    required this.onVegan,
    required this.veganContainer,
    required this.onVeganContainer,
    required this.meat,
    required this.veggie,
    required this.vegan,
  });

  final Color meat;
  final Color onMeat;
  final Color meatContainer;
  final Color onMeatContainer;

  final Color veggie;
  final Color onVeggie;
  final Color veggieContainer;
  final Color onVeggieContainer;

  final Color vegan;
  final Color onVegan;
  final Color veganContainer;
  final Color onVeganContainer;

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      meat: meat,
      onMeat: onMeat,
      meatContainer: meatContainer,
      onMeatContainer: onMeatContainer,
      veggie: veggie,
      onVeggie: onVeggie,
      veggieContainer: veggieContainer,
      onVeggieContainer: onVeggieContainer,
      vegan: vegan,
      onVegan: onVegan,
      veganContainer: veganContainer,
      onVeganContainer: onVeganContainer,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      meat: Color.lerp(meat, other.meat, t) ?? meat,
      onMeat: Color.lerp(onMeat, other.onMeat, t) ?? onMeat,
      meatContainer:
          Color.lerp(meatContainer, other.meatContainer, t) ?? meatContainer,
      onMeatContainer: Color.lerp(onMeatContainer, other.onMeatContainer, t) ??
          onMeatContainer,
      veggie: Color.lerp(veggie, other.veggie, t) ?? veggie,
      onVeggie: Color.lerp(onVeggie, other.onVeggie, t) ?? onVeggie,
      veggieContainer: Color.lerp(veggieContainer, other.veggieContainer, t) ??
          veggieContainer,
      onVeggieContainer:
          Color.lerp(onVeggieContainer, other.onVeggieContainer, t) ??
              onVeggieContainer,
      vegan: Color.lerp(vegan, other.vegan, t) ?? vegan,
      onVegan: Color.lerp(onVegan, other.onVegan, t) ?? onVegan,
      veganContainer:
          Color.lerp(veganContainer, other.veganContainer, t) ?? veganContainer,
      onVeganContainer:
          Color.lerp(onVeganContainer, other.onVeganContainer, t) ??
              onVeganContainer,
    );
  }
}

CustomColors lightCustomColors = const CustomColors(
  meat: Color(0xFF686000),
  onMeat: Color(0xFFFFFFFF),
  meatContainer: Color(0xFFF4E569),
  onMeatContainer: Color(0xFF1F1C00),
  veggie: Color(0xFF296C00),
  onVeggie: Color(0xFFFFFFFF),
  veggieContainer: Color(0xFFA4F878),
  onVeggieContainer: Color(0xFF072100),
  vegan: Color(0xFF006C52),
  onVegan: Color(0xFFFFFFFF),
  veganContainer: Color(0xFF83F8CE),
  onVeganContainer: Color(0xFF002117),
);

CustomColors darkCustomColors = const CustomColors(
  meat: Color(0xFFD7C950),
  onMeat: Color(0xFF363100),
  meatContainer: Color(0xFF4F4800),
  onMeatContainer: Color(0xFFF4E569),
  veggie: Color(0xFF89DB5F),
  onVeggie: Color(0xFF123800),
  veggieContainer: Color(0xFF1D5200),
  onVeggieContainer: Color(0xFFA4F878),
  vegan: Color(0xFF65DBB3),
  onVegan: Color(0xFF003829),
  veganContainer: Color(0xFF00513D),
  onVeganContainer: Color(0xFF83F8CE),
);