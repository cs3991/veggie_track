import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:isar_veggie_track/isar_veggie_track.dart';

void main() async {
  final isar = IsarVeggieTrack();
  await isar.isar.writeTxn(() async {
    await isar.isar.foodTypes.where().deleteAll();
    await isar.isar.meals.where().deleteAll();
  });
  group('FoodTypes', () {
    test(
      'creating a FoodType',
      () async {
        await isar.createFoodType(FoodType()
          ..label = 'Apple'
          ..carbonFootprint = 0.5);
        var apple = await isar.readFoodTypeByLabel('Apple');
        expect(apple.carbonFootprint, 0.5);
        var apple2 = await isar.readFoodType(apple.id);
        expect(apple2.carbonFootprint, 0.5);
        expect(apple2.label, 'Apple');

        expect(
          () async => isar.readFoodTypeByLabel('Banana'),
          throwsA(isA<IsarException>()),
        );
        expect(await isar.readAllFoodTypes(), [isA<FoodType>()]);
      },
    );
    test('updating a FoodType', () async {
      var apple = await isar.readFoodTypeByLabel('Apple');
      await isar.updateFoodType(apple.id, apple..carbonFootprint = 0.6);
      var apple2 = await isar.readFoodType(apple.id);
      expect(apple2.carbonFootprint, 0.6);
    });
    test('deleting a FoodType', () async {
      var apple = await isar.readFoodTypeByLabel('Apple');
      await isar.deleteFoodType(apple.id);
      expect(
        () async => isar.readFoodType(apple.id),
        throwsA(isA<IsarException>()),
      );
    });
  });
  group('Meal', () {
    test('creating a Meal', () async {
      await isar.createFoodType(FoodType()
        ..label = 'Apple'
        ..carbonFootprint = 0.5);
      var apple = await isar.readFoodTypeByLabel('Apple');
      var date = DateTime(2023, DateTime.january, 22);
      await isar.createMeal(Meal()
        ..date = date
        ..mealType = MealType.lunch
        ..foodType.value = apple
        ..quantity = 100);
      var meals = await isar.readAllMeals();
      var meal = meals[0];
      expect(
          meal,
          isA<Meal>()
              .having(
                  (m) => m.date,
                  'date',
                  isA<DateTime>()
                      .having((d) => d.day, 'day', date.day)
                      .having((d) => d.month, 'month', date.month)
                      .having((d) => d.year, 'year', date.year))
              .having((m) => m.mealType, 'mealType', MealType.lunch)
              .having(
                  (m) => m.foodType.value,
                  'foodType',
                  isA<FoodType>()
                      .having((f) => f.label, 'label', 'Apple')
                      .having((f) => f.carbonFootprint, 'carbonFootprint', 0.5))
              .having((m) => m.quantity, 'quantity', 100));
    });

    test('updating a Meal', () async {
      var meals = await isar.readAllMeals();
      var meal = meals[0];
      await isar.updateMeal(meal.id, meal..quantity = 200);
      var meals2 = await isar.readAllMeals();
      var meal2 = meals2[0];
      expect(meal2.quantity, 200);
    });

    test('deleting a Meal', () async {
      var meals = await isar.readAllMeals();
      var meal = meals[0];
      await isar.deleteMeal(meal.id);
      expect(
        () async => isar.readMeal(meal.id),
        throwsA(isA<IsarException>()),
      );
    });

    test(
      'reading all meals of january',
      () async {
        var banana = FoodType()
          ..label = 'Banana'
          ..carbonFootprint = 0.6;
        await isar.createFoodType(banana);
        await isar.createMeal(Meal()
          ..date = DateTime(2023, DateTime.january, 22)
          ..mealType = MealType.lunch
          ..quantity = 100
          ..foodType.value = await isar.readFoodTypeByLabel('Apple'));
        await isar.createMeal(Meal()
          ..date = DateTime(2023, DateTime.january, 23)
          ..mealType = MealType.lunch
          ..quantity = 100
          ..foodType.value = banana);
        await isar.createMeal(Meal()
          ..date = DateTime(2023, DateTime.february, 1)
          ..mealType = MealType.lunch
          ..quantity = 100
          ..foodType.value = banana);
        await isar.createMeal(Meal()
          ..date = DateTime(2022, DateTime.december, 31)
          ..mealType = MealType.diner
          ..quantity = 200
          ..foodType.value = banana);
        var meals = await isar.readAllMeals(
          start: DateTime(2023, DateTime.january, 1),
          end: DateTime(2023, DateTime.january, 31),
        );
        expect(meals, hasLength(2));
        expect(meals[0].date.month, 1);
        expect(meals[1].date.month, 1);
      },
    );
  });
}
