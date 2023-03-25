import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:isar_veggie_track/isar_veggie_track.dart' as isar_veggie;
import 'package:veggie_track_repository/veggie_track_repository.dart';

void main() {
  group('Repository', () {
    final repo = VeggieTrackRepository();
    test('Adding food type', () async {
      await repo.isarClient.isar.writeTxn(() async {
        await repo.isarClient.isar.foodTypes.where().deleteAll();
        await repo.isarClient.isar.meals.where().deleteAll();
      });
      await repo.addFoodType(
          FoodType(label: 'apple', carbonFootprint: 0.5, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      expect((await repo.getAllFoodTypes()).length, 1);
      // expect exception on duplicate
      expect(
          repo.addFoodType(
              FoodType(label: 'apple', carbonFootprint: 0.5, displayNameEn: 'Apple', displayNameFr: 'Pomme')),
          throwsA(isA<Exception>()));
      expect((await repo.getAllFoodTypes()).length, 1);
    });
    test('read Food Type by label', () async {
      await repo.isarClient.isar.writeTxn(() async {
        await repo.isarClient.isar.foodTypes.where().deleteAll();
        await repo.isarClient.isar.meals.where().deleteAll();
      });
      await repo.addFoodType(
          FoodType(label: 'apple', carbonFootprint: 0.5, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      var foodType = await repo.getFoodTypeByLabel('apple');
      expect(foodType.label, 'apple');
      expect(foodType.carbonFootprint, 0.5);
      expect(repo.getFoodTypeByLabel('banana'), throwsA(isA<Exception>()));
    });
    test('Adding day', () async {
      await repo.isarClient.isar.writeTxn(() async {
        await repo.isarClient.isar.foodTypes.where().deleteAll();
        await repo.isarClient.isar.meals.where().deleteAll();
      });
      await repo.addFoodType(
          FoodType(label: 'vegetable', carbonFootprint: 1, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      await repo.addFoodType(
          FoodType(label: 'eggs', carbonFootprint: 0.23, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      await repo.addFoodType(
          FoodType(label: 'chicken', carbonFootprint: 0.589, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      await repo.addFoodType(
          FoodType(label: 'carbs', carbonFootprint: 1.25, displayNameEn: 'Apple', displayNameFr: 'Pomme'));

      var date = DateTime(2023, DateTime.january, 22);
      await repo.addDay(Day(date: date, lunch: [
        Food(foodType: await repo.getFoodTypeByLabel('vegetable'), quantity: 200),
        Food(foodType: await repo.getFoodTypeByLabel('eggs'), quantity: 200),
      ], diner: [
        Food(foodType: await repo.getFoodTypeByLabel('chicken'), quantity: 200),
        Food(foodType: await repo.getFoodTypeByLabel('carbs'), quantity: 200),
      ]));

      expect(
          (await repo.getDay(date)),
          isA<Day>()
              .having(
            (d) => d.date,
            'date',
            isA<DateTime>()
                .having((p0) => p0.year, 'year', date.year)
                .having((p0) => p0.month, 'month', date.month)
                .having((p0) => p0.day, 'day', date.day),
          )
              .having((d) => d.lunch, 'lunch', [
            isA<Food>().having((f) => f.foodType, 'foodType',
                isA<FoodType>().having((f) => f.label, 'label', 'vegetable')),
            isA<Food>().having((f) => f.foodType, 'foodType',
                isA<FoodType>().having((f) => f.label, 'label', 'eggs')),
          ]).having((d) => d.diner, 'diner', [
            isA<Food>().having((f) => f.foodType, 'foodType',
                isA<FoodType>().having((f) => f.label, 'label', 'chicken')),
            isA<Food>().having((f) => f.foodType, 'foodType',
                isA<FoodType>().having((f) => f.label, 'label', 'carbs')),
          ]));
    });
    test('Relationships between day and foodtype', () async {
      await repo.isarClient.isar.writeTxn(() async {
        await repo.isarClient.isar.foodTypes.where().deleteAll();
        await repo.isarClient.isar.meals.where().deleteAll();
      });

      var date = DateTime(2023, DateTime.january, 22);
      await repo.addFoodType(
          FoodType(label: 'apple', carbonFootprint: 0.5, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      await repo.addFoodType(
          FoodType(label: 'banana', carbonFootprint: 0.5, displayNameEn: 'Apple', displayNameFr: 'Pomme'));
      await repo.addDay(Day(date: date, lunch: [
        Food(foodType: await repo.getFoodTypeByLabel('apple'), quantity: 300),
      ], diner: [
        Food(foodType: await repo.getFoodTypeByLabel('banana'), quantity: 200),
      ]));
      var appleId = (await repo.isarClient.readFoodTypeByLabel('apple')).id;
      expect(repo.isarClient.deleteFoodType(appleId), throwsA(isA<Exception>()));
    });
  });
}
