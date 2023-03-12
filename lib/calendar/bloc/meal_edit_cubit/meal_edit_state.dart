part of 'meal_edit_cubit.dart';

@immutable
abstract class MealEditState {}

class MealEditInitial extends MealEditState {}

class MealEditChooseFood extends MealEditState {
  final DateTime dateTime;
  final MealType mealType;

  MealEditChooseFood({required this.dateTime, required this.mealType});
}

class MealEditChooseQuantity extends MealEditState {
  final DateTime dateTime;
  final MealType mealType;
  final FoodType foodType;

  MealEditChooseQuantity({required this.dateTime, required this.mealType, required this.foodType});
}
