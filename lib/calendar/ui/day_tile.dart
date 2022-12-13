import 'package:flutter/material.dart';
import 'package:veggie_track/theme/custom_colors.dart';

class DayTile extends StatelessWidget {
  const DayTile({super.key});

  @override
  Widget build(BuildContext context) {
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
                Theme.of(context).extension<CustomColors>()!.veggieContainer,
                Theme.of(context).extension<CustomColors>()!.meatContainer,
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
