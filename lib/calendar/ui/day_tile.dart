import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track/theme/custom_colors.dart';

import '../bloc/month_days_bloc/month_days_bloc.dart';

class DayTile extends StatelessWidget {
  final int day;

  const DayTile({required this.day, super.key});

  @override
  Widget build(BuildContext context) {
    var color1 = Theme.of(context).extension<CustomColors>()!.getEmissionColor(
          Random().nextDouble() * 600 + 200,
        );
    var color2 = Theme.of(context).extension<CustomColors>()!.getEmissionColor(
          Random().nextDouble() * 1000,
        );
    return Stack(children: [
      BlocBuilder<MonthDaysBloc, MonthDaysState>(
        builder: (context, state) {
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
                    )
                  : (state is MonthDaysLoading
                      ? BoxDecoration(
                          color: Color.fromARGB(60, 128, 128, 128),
                          borderRadius: BorderRadius.circular(10),
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
