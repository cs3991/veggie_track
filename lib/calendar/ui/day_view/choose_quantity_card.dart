import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import '../../../theme/custom_colors.dart';
import '../../bloc/meal_edit_cubit/meal_edit_cubit.dart';
import '../../bloc/month_days_bloc/month_days_bloc.dart';

class ChooseQuantityCard extends StatelessWidget {
  final String title;
  final MealType mealType;

  ChooseQuantityCard({
    Key? key,
    required this.title,
    required this.mealType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListWheelScrollView(
                    itemExtent: 30,
                    diameterRatio: 1.05,
                    magnification: 1.2,
                    children: List.generate(
                      20,
                      (index) => Text(
                        ((index + 1) * 25).toString() + " g",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                ),
                onPressed: () {
                  var date = context.read<MonthDaysBloc>().state.date;

                  context.read<MealEditCubit>().quantityChosen(
                        date,
                        mealType,
                        0,
                      );
                },
                child: Text("Valider"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
