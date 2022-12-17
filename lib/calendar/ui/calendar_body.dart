import 'package:flutter/material.dart';
import 'package:veggie_track/calendar/ui/month_view.dart';

class CalendarBody extends StatelessWidget {
  const CalendarBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: colors.primaryContainer,
                    foregroundColor: colors.onPrimaryContainer,
                  ),
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primaryContainer,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Novembre 2022',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: colors.onPrimaryContainer,
                        ),
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: colors.primaryContainer,
                    foregroundColor: colors.onPrimaryContainer,
                  ),
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(height: 400, child: MonthView()),
          ),

          // DayTile(),
          // ColoredBox(
          //     color: Theme.of(context).extension<CustomColors>()!.meatContainer,
          //     child: Text(
          //       'Meat',
          //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //           color: Theme.of(context)
          //               .extension<CustomColors>()!
          //               .onMeatContainer),
          //     )),
          // ColoredBox(
          //     color:
          //         Theme.of(context).extension<CustomColors>()!.veggieContainer,
          //     child: Text(
          //       'Veggie',
          //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //           color: Theme.of(context)
          //               .extension<CustomColors>()!
          //               .onVeggieContainer),
          //     )),
          // ColoredBox(
          //     color:
          //         Theme.of(context).extension<CustomColors>()!.veganContainer,
          //     child: Text(
          //       'Vegan',
          //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //           color: Theme.of(context)
          //               .extension<CustomColors>()!
          //               .onVeganContainer),
          //     )),
        ],
      ),
    );
  }
}
