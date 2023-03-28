import 'package:isar_veggie_track/isar_veggie_track.dart' as isar;
import 'package:pocketbase_veggie_track/pocketbase_veggie_track.dart' as pocketbase;
import 'package:veggie_track_repository/src/models/models.dart' as models;

class VeggieTrackRepository {
  final isarClient = isar.IsarVeggieTrack();
  final pocketbaseClient = pocketbase.PocketBaseVeggieTrack();

  VeggieTrackRepository() {
    pocketbaseClient.getFoodTypes().then((pbFoodTypes) {
      isarClient.readAllFoodTypes().then((isarFoodTypes) {
        for (var pbFoodType in pbFoodTypes) {
          if (isarFoodTypes.where((isarFoodType) => isarFoodType.distantId == pbFoodType.id).isEmpty) {
            isarClient.createFoodType(isar.FoodType()
              ..label = pbFoodType.label
              ..carbonFootprint = pbFoodType.carbonFootprint
              ..displayNameEn = pbFoodType.displayNameEn ?? pbFoodType.label
              ..displayNameFr = pbFoodType.displayNameFr ?? pbFoodType.label
              ..distantId = pbFoodType.id);
          } else {
            var isarFoodType =
                isarFoodTypes.firstWhere((isarFoodType) => isarFoodType.distantId == pbFoodType.id);
            isarClient.updateFoodType(
                isarFoodType.id,
                isar.FoodType()
                  ..label = pbFoodType.label
                  ..carbonFootprint = pbFoodType.carbonFootprint
                  ..displayNameEn = pbFoodType.displayNameEn ?? pbFoodType.label
                  ..displayNameFr = pbFoodType.displayNameFr ?? pbFoodType.label
                  ..distantId = pbFoodType.id);
          }
        }
        for (var isarFoodType in isarFoodTypes) {
          if (pbFoodTypes.where((pbFoodType) => pbFoodType.id == isarFoodType.distantId).isEmpty) {
            isarClient.deleteFoodType(isarFoodType.id);
          }
        }
      });
    });

  }

  Future<void> addFoodType(models.FoodType repoFoodType) async {
    await isarClient.createFoodType(isar.FoodType()
      ..label = repoFoodType.label
      ..carbonFootprint = repoFoodType.carbonFootprint);
  }

  Future<List<models.FoodType>> getAllFoodTypes() async {
    var isarFoodTypes = await isarClient.readAllFoodTypes();
    var repoFoodTypes = isarFoodTypes
        .map<models.FoodType>((isarFoodType) => models.FoodType(
              label: isarFoodType.label,
              carbonFootprint: isarFoodType.carbonFootprint,
              displayNameEn: isarFoodType.displayNameEn,
              displayNameFr: isarFoodType.displayNameFr,
            ))
        .toList();
    return repoFoodTypes;
  }

  Future<List<isar.Meal>> _toIsarMeals(models.Day day) async {
    List<isar.Meal> meals = [];
    for (var food in day.lunch) {
      var newMeal = isar.Meal()
        ..date = day.date
        ..mealType = isar.MealType.lunch
        ..foodType.value = await isarClient.readFoodTypeByLabel(food.foodType.label)
        ..quantity = food.quantity;
      meals.add(newMeal);
    }
    for (var food in day.diner) {
      var newMeal = isar.Meal()
        ..date = day.date
        ..mealType = isar.MealType.diner
        ..foodType.value = await isarClient.readFoodTypeByLabel(food.foodType.label)
        ..quantity = food.quantity;
      meals.add(newMeal);
    }
    return meals;
  }

  Future<void> addDay(models.Day day) async {
    for (var meal in await _toIsarMeals(day)) {
      await isarClient.createMeal(meal);
    }
  }

  Future<void> editDay(models.Day day) async {
    for (var meal in await isarClient.readAllMeals(start: day.date, end: day.date)) {
      await isarClient.deleteMeal(meal.id);
    }
    for (var meal in await _toIsarMeals(day)) {
      await isarClient.createMeal(meal);
    }
  }

  Future<void> addFood(DateTime dateTime, models.MealType mealType, models.Food food) async {
    await isarClient.createMeal(isar.Meal()
      ..date = dateTime
      ..mealType = isar.MealType.values[mealType.index]
      ..foodType.value = await isarClient.readFoodTypeByLabel(food.foodType.label)
      ..quantity = food.quantity);
  }

  Future<void> deleteFood(DateTime dateTime, models.MealType mealType, models.Food food) async {
    throw UnimplementedError();
  }

  Future<void> editFood() async {
    throw UnimplementedError();
  }

  Future<models.Day> getDay(DateTime date) async {
    var endDate = date.copyWith(day: date.day + 1).subtract(const Duration(seconds: 1));
    var meals = await isarClient.readAllMeals(start: date, end: endDate);
    var lunchMeals = meals.where((meal) => meal.mealType == isar.MealType.lunch);
    var dinerMeals = meals.where((meal) => meal.mealType == isar.MealType.diner);
    List<models.Food> lunch = [];
    for (var meal in lunchMeals) {
      lunch.add(models.Food(
          foodType: models.FoodType(
            label: meal.foodType.value!.label,
            carbonFootprint: meal.foodType.value!.carbonFootprint,
            displayNameEn: meal.foodType.value!.displayNameEn,
            displayNameFr: meal.foodType.value!.displayNameFr,
          ),
          quantity: meal.quantity));
    }
    List<models.Food> diner = [];
    for (var meal in dinerMeals) {
      diner.add(models.Food(
          foodType: models.FoodType(
            label: meal.foodType.value!.label,
            carbonFootprint: meal.foodType.value!.carbonFootprint,
            displayNameEn: meal.foodType.value!.displayNameEn,
            displayNameFr: meal.foodType.value!.displayNameFr,
          ),
          quantity: meal.quantity));
    }
    return models.Day(date: date, lunch: lunch, diner: diner);
  }

  Future<models.FoodType> getFoodTypeByLabel(String s) async {
    var foodType = await isarClient.readFoodTypeByLabel(s);
    return models.FoodType(
      label: foodType.label,
      carbonFootprint: foodType.carbonFootprint,
      displayNameEn: foodType.displayNameEn,
      displayNameFr: foodType.displayNameFr,
    );
  }
}
