import 'package:flutter/material.dart';

import 'day_tile.dart';

class MonthView extends StatelessWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const DayOfWeekRow(),
        SizedBox(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (weekIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  7,
                  (dayOfWeekIndex) => Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(3),
                        child: DayTile(),
                      ),
                      Text(
                        '${weekIndex * 7 + dayOfWeekIndex + 1}',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DayOfWeekRow extends StatelessWidget {
  const DayOfWeekRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'L',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'M',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'M',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'J',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'V',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'S',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'D',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ],
    );
  }
}
