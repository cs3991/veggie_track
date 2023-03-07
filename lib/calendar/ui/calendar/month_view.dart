import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track/calendar/ui/day_view/day_page.dart';

import '../../bloc/month_days_bloc/month_days_bloc.dart';
import 'day_tile.dart';

class MonthView extends StatelessWidget {
  const MonthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const DayOfWeekRow(),
        BlocBuilder<MonthDaysBloc, MonthDaysState>(
          builder: (context, state) {
            int nbDays;
            int firstDayOfWeek;
            if (state is MonthDaysLoaded) {
              nbDays = DateTime(state.month.year, state.month.month + 1).subtract(const Duration(days: 1)).day;
              firstDayOfWeek = DateTime(state.month.year, state.month.month).weekday - 1; // 0 = Monday, 6 = Sunday
            } else {
              nbDays = 31;
              firstDayOfWeek = 0;
            }
            return SizedBox(
              height: 420,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  6,
                  (weekIndex) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      7,
                      (dayOfWeekIndex) {
                        var dayOfMonth = weekIndex * 7 + dayOfWeekIndex + 1 - firstDayOfWeek;
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: dayOfMonth <= nbDays && dayOfMonth >= 1
                                  ? InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DayPage(),
                                          ),
                                        );
                                      },
                                      child: DayTile(
                                        day: dayOfMonth,
                                        isToday: state is MonthDaysLoaded &&
                                            state.month.year == DateTime.now().year &&
                                            state.month.month == DateTime.now().month &&
                                            dayOfMonth == DateTime.now().day,
                                      ),
                                    )
                                  : const DayTile(day: null, isToday: false),
                            ),
                            dayOfMonth <= nbDays && dayOfMonth >= 1
                                ? Text(
                                    '$dayOfMonth',
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                                  )
                                : Text(
                                    ' ',
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
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
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'M',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'M',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'J',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'V',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'S',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'D',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ],
    );
  }
}
