import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import '../../bloc/meal_edit_cubit/meal_edit_cubit.dart';
import '../../bloc/month_days_bloc/month_days_bloc.dart';

class ChooseQuantityCard extends StatelessWidget {
  final String title;
  final MealType mealType;
  int quantity = 25;

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
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<MealEditCubit>().back();
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        (context.read<MealEditCubit>().state as MealEditChooseQuantity).mealEditedId == null
                            ? "Ajouter un aliment"
                            : "Modifier un aliment",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quantité de"
                    " ${(context.read<MealEditCubit>().state as MealEditChooseQuantity).foodType.label}",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListWheelScrollView(
                    itemExtent: 30,
                    diameterRatio: 1.05,
                    magnification: 1.3,
                    useMagnifier: true,
                    overAndUnderCenterOpacity: 0.5,
                    onSelectedItemChanged: (index) {
                      quantity = (index + 1) * 25;
                    },
                    children: List.generate(
                      20,
                      (index) => Text(
                        ((index + 1) * 25).toString() + " g",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
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
                  var foodType = (context.read<MealEditCubit>().state as MealEditChooseQuantity).foodType;
                  var mealEditedId =
                      (context.read<MealEditCubit>().state as MealEditChooseQuantity).mealEditedId;
                  if (mealEditedId != null) {
                    context.read<MonthDaysBloc>().editFood(date, mealType, mealEditedId, foodType, quantity);
                  } else {
                    context.read<MonthDaysBloc>().addFood(date, mealType, foodType, quantity);
                  }
                  context.read<MealEditCubit>().quantityChosen(quantity);
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
