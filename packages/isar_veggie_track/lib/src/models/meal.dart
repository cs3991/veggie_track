import 'package:isar/isar.dart';

import 'food_type.dart';

part 'meal.g.dart';

enum MealType {
  lunch,
  diner,
}

@collection
class Meal {
  Id id = Isar.autoIncrement;

  late DateTime date;

  @Enumerated(EnumType.ordinal)
  late MealType mealType;

  final foodType = IsarLink<FoodType>();

  late int quantity;
}
