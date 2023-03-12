import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import '../../bloc/meal_edit_cubit/meal_edit_cubit.dart';
import 'choose_food_card.dart';
import 'choose_quantity_card.dart';
import 'meal_card.dart';

class DayBody extends StatefulWidget {
  DayBody({
    super.key,
  });

  @override
  State<DayBody> createState() => _DayBodyState();
}

class _DayBodyState extends State<DayBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: BlocProvider(
              create: (context) => MealEditCubit(),
              child: Builder(builder: (context) {
                return BlocBuilder<MealEditCubit, MealEditState>(
                  builder: (context, state) {
                    if (state is MealEditInitial) {
                      return MealCard(
                        title: 'Déjeuner',
                        mealType: MealType.lunch,
                      );
                    }
                    if (state is MealEditChooseFood) {
                      return ChooseFoodCard(
                        title: 'Déjeuner',
                        mealType: MealType.lunch,
                      );
                    }
                    if (state is MealEditChooseQuantity) {
                      return ChooseQuantityCard(
                        title: 'Déjeuner',
                        mealType: MealType.lunch,
                      );
                    } else {
                      throw Exception('Unknown state');
                    }
                  },
                );
              }),
            ),
            // MealCard(
            //   title: 'Déjeuner',
            //   mealType: MealType.lunch,
            // ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: MealCard(
              title: 'Diner',
              mealType: MealType.diner,
            ),
          ),
        ),
      ],
    );
  }
}
