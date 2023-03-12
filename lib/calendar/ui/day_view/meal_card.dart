import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track/calendar/bloc/meal_edit_cubit/meal_edit_cubit.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import '../../../theme/custom_colors.dart';
import '../../bloc/month_days_bloc/month_days_bloc.dart';
import 'context_menu_region.dart';

class MealCard extends StatelessWidget {
  final String title;
  final MealType mealType;

  const MealCard({
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
                  child: BlocBuilder<MonthDaysBloc, MonthDaysState>(
                    builder: (context, state) {
                      var day = (state is MonthDaysLoaded) ? state.days[state.date.day - 1] : null;
                      var mealOrNull = mealType == MealType.lunch ? day?.lunch : day?.diner;
                      var itemCount = mealOrNull?.length == null ? 1 : mealOrNull!.length + 1;
                      var date = state.date;
                      return ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          if (index == itemCount - 1) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(20),
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                ),
                                onPressed: () {
                                  context.read<MealEditCubit>().addFood(date, mealType);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            );
                          } else {
                            var meal = mealOrNull!; // If we build an item, then meal is not null.
                            var food = meal[index];
                            var carbonEmissions = (food.foodType.carbonFootprint * food.quantity).toInt();
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ContextMenuRegion(
                                contextMenuBuilder: (context, offset) {
                                  return AdaptiveTextSelectionToolbar.buttonItems(
                                    anchors: TextSelectionToolbarAnchors(
                                      primaryAnchor: offset,
                                    ),
                                    buttonItems: <ContextMenuButtonItem>[
                                      ContextMenuButtonItem(
                                        label: 'Supprimer',
                                        onPressed: () {
                                          ContextMenuController.removeAny();
                                          context.read<MonthDaysBloc>().deleteFood(state.date, mealType, index);
                                        },
                                      ),
                                    ],
                                  );
                                },
                                child: ListTile(
                                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  // onTap: () {},
                                  title: Text(
                                    food.foodType.label,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        ),
                                  ),
                                  subtitle: Text(
                                    '${food.quantity.toString()} g',
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        ),
                                  ),
                                  trailing: Text(
                                    '$carbonEmissions gCO2eq',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).extension<CustomColors>()!.getEmissionColor(carbonEmissions.toDouble()),
                                        ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
