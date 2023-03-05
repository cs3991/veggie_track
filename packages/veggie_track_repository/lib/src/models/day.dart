import 'package:json_annotation/json_annotation.dart';

import 'food.dart';

part 'day.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Day {
  Day({required this.date, required this.lunch, required this.diner});

  DateTime date;
  List<Food> lunch;
  List<Food> diner;

  double getLunchCarbonFootprint() {
    double lunchCarbonFootprint = 0;
    for (var food in lunch) {
      lunchCarbonFootprint += food.quantity * food.foodType.carbonFootprint;
    }
    return lunchCarbonFootprint;
  }

  double getDinerCarbonFootprint() {
    double dinerCarbonFootprint = 0;
    for (var food in diner) {
      dinerCarbonFootprint += food.quantity * food.foodType.carbonFootprint;
    }
    return dinerCarbonFootprint;
  }

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  String toString() {
    return 'Day{date: $date, lunch: $lunch, diner: $diner}';
  }
}
