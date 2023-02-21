import 'package:flutter/foundation.dart';
import 'package:isar_veggie_track/isar_veggie_track.dart' as isar;
import 'package:veggie_track_repository/src/models/models.dart' as models;

class VeggieTrackRepository {
  final isarVeggieTrack = isar.IsarVeggieTrack();

  VeggieTrackRepository() {
    populateFoodTypes();
  }

  Future<void> addFoodType(models.FoodType repoFoodType) async {
    if ((await isarVeggieTrack.readFoodTypeByLabel(repoFoodType.label)) ==
        null) {
      await isarVeggieTrack.createFoodType(isar.FoodType()
        ..label = repoFoodType.label
        ..carbonFootprint = repoFoodType.carbonFootprint);
    } else {
      if (kDebugMode) {
        print("The FoodType with label ${repoFoodType.label} already exists");
      }
    }
  }

  Future<void> populateFoodTypes() async {
    addFoodType(models.FoodType(label: "beef", carbonFootprint: 99.48));
    addFoodType(models.FoodType(label: "beef_dairy", carbonFootprint: 33.3));
    addFoodType(models.FoodType(label: "vegetable", carbonFootprint: 0.53));
    addFoodType(models.FoodType(label: "fruit", carbonFootprint: 1.1));
    addFoodType(models.FoodType(label: "pork", carbonFootprint: 12.31));
    addFoodType(models.FoodType(label: "carbs", carbonFootprint: 4));
    addFoodType(models.FoodType(label: "fish", carbonFootprint: 14.63));
    addFoodType(models.FoodType(label: "poultry", carbonFootprint: 9.87));
    addFoodType(models.FoodType(label: "cheese", carbonFootprint: 23.88));
    addFoodType(models.FoodType(label: "eggs", carbonFootprint: 4.67));
  }

  Future<List<models.FoodType>> getAllFoodTypes() async {
    var isarFoodTypes = await isarVeggieTrack.readAllFoodTypes();
    var repoFoodTypes = isarFoodTypes
        .map<models.FoodType>((isarFoodType) => models.FoodType(
            label: isarFoodType.label,
            carbonFootprint: isarFoodType.carbonFootprint))
        .toList();
    return repoFoodTypes;
  }

  Future<List<isar.Meal>> _toIsarMeals(models.Day day) async {
    List<isar.Meal> meals = [];
    for (var food in day.lunch) {
      meals.add(isar.Meal()
        ..date = day.date
        ..mealType = isar.MealType.lunch
        ..foodType.value =
            await isarVeggieTrack.readFoodTypeByLabel(food.foodType.label)
        ..quantity = food.quantity);
    }
    for (var food in day.diner) {
      meals.add(isar.Meal()
        ..date = day.date
        ..mealType = isar.MealType.diner
        ..foodType.value =
            await isarVeggieTrack.readFoodTypeByLabel(food.foodType.label)
        ..quantity = food.quantity);
    }
    return meals;
  }

  Future<void> addDay(models.Day day) async {
    for (var meal in await _toIsarMeals(day)) {
      await isarVeggieTrack.createMeal(meal);
    }
  }

  Future<void> editDay(models.Day day) async {
    for (var meal
        in await isarVeggieTrack.readAllMeals(start: day.date, end: day.date)) {
      await isarVeggieTrack.deleteMeal(meal.id);
    }
    for (var meal in await _toIsarMeals(day)) {
      await isarVeggieTrack.createMeal(meal);
    }
  }

  Future<models.Day> getDay(DateTime date) async {
    var meals = await isarVeggieTrack.readAllMeals(start: date, end: date);
    var lunchMeals =
        meals.where((meal) => meal.mealType == isar.MealType.lunch);
    var dinerMeals =
        meals.where((meal) => meal.mealType == isar.MealType.diner);
    List<models.Food> lunch = [];
    for (var meal in lunchMeals) {
      lunch.add(models.Food(
          foodType: models.FoodType(
              label: meal.foodType.value!.label,
              carbonFootprint: meal.foodType.value!.carbonFootprint),
          quantity: meal.quantity));
    }
    List<models.Food> diner = [];
    for (var meal in dinerMeals) {
      diner.add(models.Food(
          foodType: models.FoodType(
              label: meal.foodType.value!.label,
              carbonFootprint: meal.foodType.value!.carbonFootprint),
          quantity: meal.quantity));
    }
    return models.Day(date: date, lunch: lunch, diner: diner);
  }
}
