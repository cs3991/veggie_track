import 'package:flutter_test/flutter_test.dart';
import 'package:veggie_track_api/veggie_track_api.dart';

void main() {
  group("Day", () {
    group("FromJson", () {
      test(
          "Returns correct Day object",
          () => expect(
              Day.fromJson({
                "date": "2021-04-24T20:00:00.000Z",
                "lunch": [
                  {"food_type": "vegetables", "quantity": 200},
                  {"food_type": "cereals", "quantity": 150}
                ],
                "diner": [
                  {"food_type": "fish", "quantity": 200},
                  {"food_type": "vegetables", "quantity": 150}
                ]
              }),
              isA<Day>()
                  .having((d) => d.date, "date", "2021-04-24T20:00:00.000Z")
                  .having((d) => d.lunch, "lunch", [
                isA<Food>()
                    .having((f) => f.foodType, "foodType", "vegetables")
                    .having((f) => f.quantity, "quantity", 200),
                isA<Food>()
                    .having((f) => f.foodType, "foodType", "cereals")
                    .having((f) => f.quantity, "quantity", 150),
              ]).having((d) => d.diner, "diner", [
                isA<Food>()
                    .having((f) => f.foodType, "foodType", "fish")
                    .having((f) => f.quantity, "quantity", 200),
                isA<Food>()
                    .having((f) => f.foodType, "foodType", "vegetables")
                    .having((f) => f.quantity, "quantity", 150),
              ])));
      test(
          "Works when a meal is null",
          () => expect(
              Day.fromJson({
                "date": "2021-04-24T20:00:00.000Z",
              }),
              isA<Day>()
                  .having((d) => d.date, "date", "2021-04-24T20:00:00.000Z")
                  .having((d) => d.lunch, "lunch", null)
                  .having((d) => d.diner, "diner", null)));
    });
    test(
        "Throws an exception when date is null",
        () => expect(
            () => Day.fromJson({
                  "lunch": [
                    {"food_type": "vegetables", "quantity": 200},
                    {"food_type": "cereals", "quantity": 150}
                  ],
                  "diner": [
                    {"food_type": "fish", "quantity": 200},
                    {"food_type": "vegetables", "quantity": 150}
                  ]
                }),
            throwsA(isA<Error>())));
  });
}
