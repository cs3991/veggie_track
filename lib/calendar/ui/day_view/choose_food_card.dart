import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import '../../../theme/custom_colors.dart';
import '../../bloc/meal_edit_cubit/meal_edit_cubit.dart';
import '../../bloc/month_days_bloc/month_days_bloc.dart';

class ChooseFoodCard extends StatelessWidget {

  const ChooseFoodCard({
    Key? key,
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
                        (context.read<MealEditCubit>().state as MealEditChooseFood).mealEditedId == null
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FutureBuilder(
                    future: context.read<MonthDaysBloc>().veggieTrackRepository.getAllFoodTypes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var foodTypes = snapshot.data as List<FoodType>;
                        return ListView.builder(
                          itemCount: foodTypes.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Aliment",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                                ),
                              );
                            } else {
                              index = index - 1;
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  onTap: () {
                                    context.read<MealEditCubit>().foodChosen(
                                          foodTypes[index],
                                        );
                                  },
                                  title: Text(
                                    foodTypes[index].label,
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        ),
                                  ),
                                  trailing: Text(
                                    '${foodTypes[index].carbonFootprint} kgCO2eq/kg',
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                          color: Theme.of(context)
                                              .extension<CustomColors>()!
                                              .getEmissionColor(foodTypes[index].carbonFootprint * 200),
                                        ),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
