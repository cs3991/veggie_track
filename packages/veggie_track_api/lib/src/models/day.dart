import 'package:json_annotation/json_annotation.dart';

import 'food.dart';

part 'day.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Day {
  Day(this.date, this.lunch, this.diner);

  DateTime date;
  List<Food> lunch;
  List<Food> diner;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
