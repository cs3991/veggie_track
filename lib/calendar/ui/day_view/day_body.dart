import 'package:flutter/material.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

import 'meal_card.dart';

class DayBody extends StatefulWidget {
  const DayBody({
    super.key,
  });

  @override
  State<DayBody> createState() => _DayBodyState();
}

class _DayBodyState extends State<DayBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: MealCard(
              title: 'Déjeuner',
              mealType: MealType.lunch,
            ),
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
