import 'dart:math';

import 'package:flutter/material.dart';
import 'package:veggie_track/theme/custom_colors.dart';

class DayTile extends StatelessWidget {
  const DayTile({super.key});

  @override
  Widget build(BuildContext context) {
    var color1 = Theme.of(context).extension<CustomColors>()!.getEmissionColor(
          Random().nextDouble() * 600 + 200,
        );
    var color2 = Theme.of(context).extension<CustomColors>()!.getEmissionColor(
          Random().nextDouble() * 1000,
        );
    return Stack(children: [
      SizedBox(
        height: 41,
        width: 41,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [.5, .5],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color1,
                color2,
                // top Right part
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 2,
            ),
          ),
        ),
      )
    ]);
  }
}
