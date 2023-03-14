part of 'meal_edit_cubit.dart';

@immutable
abstract class MealEditState {}

class MealEditInitial extends MealEditState {}

class MealEditChooseFood extends MealEditState {
  final DateTime dateTime;
  final MealType mealType;
  final int? mealEditedId;

  MealEditChooseFood({required this.dateTime, required this.mealType, this.mealEditedId});
}

class MealEditChooseQuantity extends MealEditState {
  final DateTime dateTime;
  final MealType mealType;
  final FoodType foodType;
  final int? mealEditedId;

  MealEditChooseQuantity(
      {required this.dateTime, required this.mealType, required this.foodType, this.mealEditedId});
}
