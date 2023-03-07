import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track/theme/custom_colors.dart';

import '../../bloc/month_days_bloc/month_days_bloc.dart';

class DayTile extends StatelessWidget {
  final int? day;
  final bool isToday;

  const DayTile({required this.day, required this.isToday, super.key});

  @override
  Widget build(BuildContext context) {
    if (day == null) {
      return const SizedBox(
        height: 41,
        width: 41,
      );
    } else {
      var day = this.day!;
      return Stack(children: [
        BlocBuilder<MonthDaysBloc, MonthDaysState>(
          builder: (context, state) {
            var lunchColor = Colors.transparent;
            var dinerColor = Colors.transparent;
            if (state is MonthDaysLoaded) {
              var lunchEmissions = state.days[day - 1].getLunchCarbonFootprint();
              lunchColor = lunchEmissions == 0 ? Colors.transparent : Theme.of(context).extension<CustomColors>()!.getEmissionColor(lunchEmissions);
              var dinerEmissions = state.days[day - 1].getDinerCarbonFootprint();
              dinerColor = dinerEmissions == 0 ? Colors.transparent : Theme.of(context).extension<CustomColors>()!.getEmissionColor(dinerEmissions);
            }

            return SizedBox(
              height: 41,
              width: 41,
              child: Container(
                decoration: state is MonthDaysLoaded
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          stops: const [.5, .5],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            lunchColor,
                            dinerColor,
                            // top Right part
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isToday ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.outline,
                          width: 2,
                        ),
                      )
                    : (state is MonthDaysLoading
                        ? BoxDecoration(
                            // color: Color.fromARGB(26, 128, 128, 128),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.4),
                              width: 2,
                            ),
                          )
                        : BoxDecoration(
                            color: Color.fromARGB(60, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                          )),
              ),
            );
          },
        )
      ]);
    }
  }
}
