import 'package:json_annotation/json_annotation.dart';

part 'food_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FoodType {
  FoodType({required this.label, required this.carbonFootprint});

  String label;
  double carbonFootprint;

  factory FoodType.fromJson(Map<String, dynamic> json) =>
      _$FoodTypeFromJson(json);

  Map<String, dynamic> toJson() => _$FoodTypeToJson(this);

  @override
  String toString() {
    return 'FoodType{label: $label, carbonFootprint: $carbonFootprint}';
  }
}
