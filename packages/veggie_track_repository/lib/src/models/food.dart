import 'package:json_annotation/json_annotation.dart';

import 'food_type.dart';

part 'food.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Food {
  Food({required this.foodType, required this.quantity});

  FoodType foodType;
  int quantity;

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);

  @override
  String toString() {
    return 'Food{foodType: $foodType, quantity: $quantity}';
  }
}
