import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track/theme/custom_colors.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import '../../bloc/month_days_bloc/month_days_bloc.dart';

class DayBody extends StatelessWidget {
  final int day;
  const DayBody({
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: MealCard(
              title: 'Déjeuner',
              mealType: MealType.lunch,
              dayOfMonth: day,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: MealCard(
              title: 'Diner',
              mealType: MealType.diner,
              dayOfMonth: day,
            ),
          ),
        ),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  final String title;
  final MealType mealType;
  final int dayOfMonth;

  const MealCard({
    Key? key,
    required this.title,
    required this.mealType,
    required this.dayOfMonth,
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
                      var day = (state is MonthDaysLoaded) ? state.days[dayOfMonth - 1] : null;
                      var mealOrNull = mealType == MealType.lunch ? day?.lunch : day?.diner;
                      var itemCount = mealOrNull?.length == null ? 1 : mealOrNull!.length + 1;
                      return ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          if (index == itemCount - 1) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ElevatedButton(
                                child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimaryContainer),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Theme.of(context).colorScheme.primaryContainer, // <-- Button color
                                ),
                                onPressed: () {},
                              ),
                            );
                          } else {
                            var meal = mealOrNull!; // If we build an item, then meal is not null.
                            var food = meal[index];
                            var carbonEmissions = food.foodType.carbonFootprint * food.quantity;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: ListTile(
                                tileColor: Theme.of(context).colorScheme.primaryContainer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                ),
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
                                  '${carbonEmissions} gCO2eq',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Theme.of(context).extension<CustomColors>()!.getEmissionColor(2000),
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

enum MealType { lunch, diner }
