import 'package:isar_veggie_track/isar_veggie_track.dart' as isar;
import 'package:veggie_track_repository/src/models/models.dart' as models;

class VeggieTrackRepository {
  final isarVeggieTrack = isar.IsarVeggieTrack();

  VeggieTrackRepository() {
    isarVeggieTrack.readAllFoodTypes().then((value) => {
          if (value.isEmpty) {populateFoodTypes()}
        });
    // addDay(models.Day(date: DateTime(2023, 03, 4), lunch: [], diner: []));
    // addDay(models.Day(date: DateTime(2023, 03, 5), lunch: [
    //   models.Food(
    //       foodType: models.FoodType(label: 'beef', carbonFootprint: 5155),
    //       quantity: 200)
    // ], diner: [
    //   models.Food(
    //       foodType: models.FoodType(label: 'vegetable', carbonFootprint: 5155),
    //       quantity: 300),
    //   models.Food(
    //       foodType: models.FoodType(label: 'carbs', carbonFootprint: 5155),
    //       quantity: 200)
    // ]));
  }

  Future<void> addFoodType(models.FoodType repoFoodType) async {
    await isarVeggieTrack.createFoodType(isar.FoodType()
      ..label = repoFoodType.label
      ..carbonFootprint = repoFoodType.carbonFootprint);
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
        .map<models.FoodType>((isarFoodType) =>
            models.FoodType(label: isarFoodType.label, carbonFootprint: isarFoodType.carbonFootprint))
        .toList();
    return repoFoodTypes;
  }

  Future<List<isar.Meal>> _toIsarMeals(models.Day day) async {
    List<isar.Meal> meals = [];
    for (var food in day.lunch) {
      var newMeal = isar.Meal()
        ..date = day.date
        ..mealType = isar.MealType.lunch
        ..foodType.value = await isarVeggieTrack.readFoodTypeByLabel(food.foodType.label)
        ..quantity = food.quantity;
      meals.add(newMeal);
    }
    for (var food in day.diner) {
      var newMeal = isar.Meal()
        ..date = day.date
        ..mealType = isar.MealType.diner
        ..foodType.value = await isarVeggieTrack.readFoodTypeByLabel(food.foodType.label)
        ..quantity = food.quantity;
      meals.add(newMeal);
    }
    return meals;
  }

  Future<void> addDay(models.Day day) async {
    for (var meal in await _toIsarMeals(day)) {
      await isarVeggieTrack.createMeal(meal);
    }
  }

  Future<void> editDay(models.Day day) async {
    for (var meal in await isarVeggieTrack.readAllMeals(start: day.date, end: day.date)) {
      await isarVeggieTrack.deleteMeal(meal.id);
    }
    for (var meal in await _toIsarMeals(day)) {
      await isarVeggieTrack.createMeal(meal);
    }
  }

  Future<void> addFood(DateTime dateTime, models.MealType mealType, models.Food food) async {
    await isarVeggieTrack.createMeal(isar.Meal()
      ..date = dateTime
      ..mealType = isar.MealType.values[mealType.index]
      ..foodType.value = await isarVeggieTrack.readFoodTypeByLabel(food.foodType.label)
      ..quantity = food.quantity);
  }

  Future<void> deleteFood(DateTime dateTime, models.MealType mealType, models.Food food) async {
    throw UnimplementedError();
  }

  Future<void> editFood() async {
    throw UnimplementedError();
  }

  Future<models.Day> getDay(DateTime date) async {
    var meals = await isarVeggieTrack.readAllMeals(start: date, end: date);
    var lunchMeals = meals.where((meal) => meal.mealType == isar.MealType.lunch);
    var dinerMeals = meals.where((meal) => meal.mealType == isar.MealType.diner);
    List<models.Food> lunch = [];
    for (var meal in lunchMeals) {
      lunch.add(models.Food(
          foodType: models.FoodType(
              label: meal.foodType.value!.label, carbonFootprint: meal.foodType.value!.carbonFootprint),
          quantity: meal.quantity));
    }
    List<models.Food> diner = [];
    for (var meal in dinerMeals) {
      diner.add(models.Food(
          foodType: models.FoodType(
              label: meal.foodType.value!.label, carbonFootprint: meal.foodType.value!.carbonFootprint),
          quantity: meal.quantity));
    }
    return models.Day(date: date, lunch: lunch, diner: diner);
  }

  Future<models.FoodType> getFoodTypeByLabel(String s) async {
    var foodType = await isarVeggieTrack.readFoodTypeByLabel(s);
    return models.FoodType(label: foodType.label, carbonFootprint: foodType.carbonFootprint);
  }
}
