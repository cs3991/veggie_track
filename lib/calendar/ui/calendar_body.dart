import 'package:flutter/material.dart';
import 'package:veggie_track/theme/custom_colors.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColoredBox(
              color: Theme.of(context).extension<CustomColors>()!.meatContainer,
              child: Text(
                'Meat',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .extension<CustomColors>()!
                        .onMeatContainer),
              )),
          ColoredBox(
              color:
                  Theme.of(context).extension<CustomColors>()!.veggieContainer,
              child: Text(
                'Veggie',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .extension<CustomColors>()!
                        .onVeggieContainer),
              )),
          ColoredBox(
              color:
                  Theme.of(context).extension<CustomColors>()!.veganContainer,
              child: Text(
                'Vegan',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .extension<CustomColors>()!
                        .onVeganContainer),
              )),
        ],
      ),
    );
  }
}
