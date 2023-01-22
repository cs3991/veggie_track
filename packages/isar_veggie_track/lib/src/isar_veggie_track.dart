import 'dart:async';

import 'package:isar/isar.dart';

import 'models/models.dart';

class IsarException implements Exception {
  final String message;

  IsarException(this.message);

  @override
  String toString() {
    return 'IsarException: $message';
  }
}

class IsarVeggieTrack {
  final isar = Isar.openSync([MealSchema, FoodTypeSchema]);

  Future<void> createFoodType(FoodType foodType) async {
    await isar.writeTxn(() async {
      await isar.foodTypes.put(foodType);
    });
  }

  Future<FoodType> readFoodType(Id id) async {
    var result = await isar.foodTypes.get(id);
    if (result == null) {
      throw IsarException("The FoodType with id $id does not exist");
    }
    return result;
  }

  Future<FoodType> readFoodTypeByLabel(String label) async {
    var result = await isar.foodTypes.filter().labelEqualTo(label).findFirst();
    if (result == null) {
      throw IsarException("The FoodType with label $label does not exist");
    }
    return result;
  }

  Future<void> updateFoodType(Id id, FoodType foodType) async {
    var foodTypeToUpdate = await isar.foodTypes.get(id);
    if (foodTypeToUpdate == null) {
      throw IsarException("The FoodType with id $id does not exist");
    }
    foodType.id = id;
    await isar.writeTxn(() async {
      await isar.foodTypes.put(foodType);
    });
  }

  Future<void> deleteFoodType(Id id) async {
    var foodTypeToDelete = isar.foodTypes.getSync(id);
    if (foodTypeToDelete == null) {
      throw IsarException("The FoodType with id $id does not exist");
    }
    await isar.writeTxn(() async {
      await isar.foodTypes.delete(id);
    });
  }

  Future<List<FoodType>> readAllFoodTypes() async {
    var foodTypes = await isar.foodTypes.where().findAll();
    return foodTypes;
  }

  Future<Meal> readMeal(Id id) async {
    var result = await isar.meals.get(id);
    if (result == null) {
      throw IsarException("The Meal with id $id does not exist");
    }
    return result;
  }

  Future<void> createMeal(Meal meal) async {
    await isar.writeTxn(() async {
      await isar.meals.put(meal);
      await meal.foodType.save(); // The link has to be saved manually
    });
  }

  Future<void> updateMeal(Id id, Meal meal) async {
    var mealToUpdate = isar.meals.getSync(id);
    if (mealToUpdate == null) {
      throw IsarException("The Meal with id $id does not exist");
    }
    meal.id = id;
    await isar.writeTxn(() async {
      await isar.meals.put(meal);
    });
  }

  Future<void> deleteMeal(Id id) async {
    var mealToDelete = isar.meals.getSync(id);
    if (mealToDelete == null) {
      throw IsarException("The Meal with id $id does not exist");
    }
    await isar.writeTxn(() async {
      await isar.meals.delete(id);
    });
  }

  Future<List<Meal>> readAllMeals({DateTime? start, DateTime? end}) async {
    return await isar.meals
        .filter()
        .optional(
          start != null,
          (q) => q.dateGreaterThan(start!, include: true),
        )
        .optional(
          end != null,
          (q) => q.dateLessThan(end!, include: true),
        )
        .findAll();
  }
}
