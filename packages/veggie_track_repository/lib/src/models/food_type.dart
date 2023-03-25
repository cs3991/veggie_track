import 'package:json_annotation/json_annotation.dart';

part 'food_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FoodType {
  FoodType({
    required this.label,
    required this.carbonFootprint,
    required this.displayNameFr,
    required this.displayNameEn,
  });

  String label;
  double carbonFootprint;
  final String displayNameFr;
  final String displayNameEn;

  factory FoodType.fromJson(Map<String, dynamic> json) => _$FoodTypeFromJson(json);

  Map<String, dynamic> toJson() => _$FoodTypeToJson(this);

  @override
  String toString() {
    return 'FoodType{label: $label, carbonFootprint: $carbonFootprint}';
  }
}
