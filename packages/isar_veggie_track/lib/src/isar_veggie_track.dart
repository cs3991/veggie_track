import 'dart:async';

import 'package:isar/isar.dart';
import 'package:veggie_track_api/veggie_track_api.dart' as api;

import 'models/models.dart';

class IsarVeggieTrack {
  final isar = Isar.openSync([MealSchema, FoodTypeSchema]);

  IsarVeggieTrack() {
    if (isar.foodTypes.countSync() == 0) {
      print('No food types found, creating default food types');
      insertDummyData();
    } else {
      print('Found ${isar.foodTypes.countSync()} food types');
    }
  }

  void addFoodType(api.FoodType foodType) {
    isar.writeTxn(() async {
      await isar.foodTypes.put(FoodType()
        ..label = foodType.label
        ..carbonFootprint = foodType.carbonFootprint);
    });
  }

  Future<void> addMeal(
      List<api.Food> foods, DateTime date, MealType mealType) async {
    for (var food in foods) {
      var foodType = await isar.foodTypes
          .filter()
          .labelEqualTo(food.foodType.label)
          .findFirst();
      if (foodType == null) {
        var id = await isar.foodTypes.put(FoodType()
          ..label = food.foodType.label
          ..carbonFootprint = food.foodType.carbonFootprint);
        foodType = await isar.foodTypes.get(id);
      }
      await isar.meals.put(Meal()
        ..date = date
        ..mealType = mealType
        ..foodType.value = foodType
        ..quantity = food.quantity);
    }
  }

  void addDay(api.Day day) {
    isar.writeTxn(() async {
      await addMeal(day.diner, day.date, MealType.diner);
      await addMeal(day.lunch, day.date, MealType.lunch);
    });
  }

  Future<List<api.FoodType>> getAllFoodTypes() async {
    var foodTypes = await isar.foodTypes.where().findAll();
    return foodTypes
        .map((foodType) => api.FoodType(
            label: foodType.label, carbonFootprint: foodType.carbonFootprint))
        .toList();
  }

  void insertDummyData() {
    print("Inserting dummy data");

    isar.writeTxn(() async {
      var beef = FoodType()
        ..label = "beef"
        ..carbonFootprint = 99.48;
      await isar.foodTypes.put(beef);
      var beef_dairy = FoodType()
        ..label = "beef_dairy"
        ..carbonFootprint = 33.3;
      await isar.foodTypes.put(beef_dairy);
      var vegetable = FoodType()
        ..label = "vegetable"
        ..carbonFootprint = 0.53;
      await isar.foodTypes.put(vegetable);
      var fruit = FoodType()
        ..label = "fruit"
        ..carbonFootprint = 1.1;
      await isar.foodTypes.put(fruit);
      var pork = FoodType()
        ..label = "pork"
        ..carbonFootprint = 12.31;
      await isar.foodTypes.put(pork);
      var carbs = FoodType()
        ..label = "carbs"
        ..carbonFootprint = 4;
      await isar.foodTypes.put(carbs);
      var fish = FoodType()
        ..label = "fish"
        ..carbonFootprint = 14.63;
      await isar.foodTypes.put(fish);
      var poultry = FoodType()
        ..label = "poultry"
        ..carbonFootprint = 9.87;
      await isar.foodTypes.put(poultry);
      var cheese = FoodType()
        ..label = "cheese"
        ..carbonFootprint = 23.88;
      await isar.foodTypes.put(cheese);
      var eggs = FoodType()
        ..label = "eggs"
        ..carbonFootprint = 4.67;
      await isar.foodTypes.put(eggs);

      await isar.meals.put(Meal()
        ..date = DateTime(2022, 12, 29)
        ..mealType = MealType.lunch
        ..foodType.value = beef
        ..quantity = 300);
      await isar.meals.put(Meal()
        ..date = DateTime(2022, 12, 29)
        ..mealType = MealType.lunch
        ..foodType.value = vegetable
        ..quantity = 200);
      await isar.meals.put(Meal()
        ..date = DateTime(2022, 12, 29)
        ..mealType = MealType.diner
        ..foodType.value = vegetable
        ..quantity = 200);
    });
  }
}
