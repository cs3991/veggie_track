import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:isar_veggie_track/isar_veggie_track.dart' as isar_veggie;
import 'package:veggie_track_repository/veggie_track_repository.dart';

void main() {
  group('Repository', () {
    final repo = VeggieTrackRepository();
    test('Adding food type', () async {
      await repo.isarVeggieTrack.isar.writeTxn(() async {
        await repo.isarVeggieTrack.isar.foodTypes.where().deleteAll();
        await repo.isarVeggieTrack.isar.meals.where().deleteAll();
      });
      await repo.addFoodType(FoodType(label: 'apple', carbonFootprint: 0.5));
      expect((await repo.getAllFoodTypes()).length, 1);
      await repo.addFoodType(FoodType(label: 'apple', carbonFootprint: 0.5));
      expect((await repo.getAllFoodTypes()).length, 1);
    });
    test('Adding day', () async {
      await repo.isarVeggieTrack.isar.writeTxn(() async {
        await repo.isarVeggieTrack.isar.foodTypes.where().deleteAll();
        await repo.isarVeggieTrack.isar.meals.where().deleteAll();
      });
      await repo.addDay(Day(date: DateTime.now(), lunch: [
        Food(
            foodType: FoodType(label: 'vegetable', carbonFootprint: 1),
            quantity: 200),
        Food(
            foodType: FoodType(label: 'eggs', carbonFootprint: 1),
            quantity: 200),
      ], diner: [
        Food(
            foodType: FoodType(label: 'chicken', carbonFootprint: 1),
            quantity: 200),
        Food(
            foodType: FoodType(label: 'carbs', carbonFootprint: 1),
            quantity: 200),
      ]));
      expect(
          (await repo.getDay(DateTime.now())),
          isA<Day>()
            ..having(
              (d) => d.date,
              'date',
              isA<DateTime>()
                  .having((p0) => p0.year, 'year', DateTime.now().year)
                  .having((p0) => p0.month, 'month', DateTime.now().month)
                  .having((p0) => p0.day, 'day', DateTime.now().day),
            )
            ..having((d) => d.lunch, 'lunch', [
              isA<Food>().having((f) => f.foodType, 'foodType',
                  isA<FoodType>().having((f) => f.label, 'label', 'vegetable')),
              isA<Food>().having((f) => f.foodType, 'foodType',
                  isA<FoodType>().having((f) => f.label, 'label', 'eggs')),
            ])
            ..having((d) => d.diner, 'diner', [
              isA<Food>().having((f) => f.foodType, 'foodType',
                  isA<FoodType>().having((f) => f.label, 'label', 'chicken')),
              isA<Food>().having((f) => f.foodType, 'foodType',
                  isA<FoodType>().having((f) => f.label, 'label', 'carbs')),
            ]));
    });
  });
}
