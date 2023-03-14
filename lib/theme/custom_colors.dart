import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.highEmission,
    required this.mediumEmission,
    required this.lowEmission,
  });

  final Color highEmission;

  final Color mediumEmission;

  final Color lowEmission;

  @override
  ThemeExtension<CustomColors> copyWith() {
    return CustomColors(
      highEmission: highEmission,
      mediumEmission: mediumEmission,
      lowEmission: lowEmission,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      highEmission: Color.lerp(
            highEmission,
            other.highEmission,
            t,
          ) ??
          highEmission,
      mediumEmission: Color.lerp(
            mediumEmission,
            other.mediumEmission,
            t,
          ) ??
          mediumEmission,
      lowEmission: Color.lerp(
            lowEmission,
            other.lowEmission,
            t,
          ) ??
          lowEmission,
    );
  }

  Color getEmissionColor(double emissions) {
    // Define the minimum and maximum emissions
    const double minEmissions = 0;
    const double maxEmissions = 4000;

    // Normalize the emissions value to a value between 0 and 1
    double t = (emissions - minEmissions) / (maxEmissions - minEmissions);
    t = t.clamp(0.0, 1.0);

    // Convert the colors to HSVColor objects
    final HSVColor hsvColor1 = HSVColor.fromColor(lowEmission);
    final HSVColor hsvColor2 = HSVColor.fromColor(mediumEmission);
    final HSVColor hsvColor3 = HSVColor.fromColor(highEmission);

    // Use HSVColor.lerp to calculate the color at the given emissions value
    if (t <= 0.5) {
      return HSVColor.lerp(hsvColor1, hsvColor2, t * 2)!.toColor();
    } else {
      return HSVColor.lerp(hsvColor2, hsvColor3, (t - 0.5) * 2)!.toColor();
    }
  }
}

CustomColors lightCustomColors = const CustomColors(
  highEmission: Color(0xFFF66A41),
  mediumEmission: Color(0xFFF1E432),
  lowEmission: Color(0xFF45ECC2),
);

CustomColors darkCustomColors = const CustomColors(
  highEmission: Color(0xFFB73B15),
  mediumEmission: Color(0xFF9D9200),
  lowEmission: Color(0xFF006C52),
);
