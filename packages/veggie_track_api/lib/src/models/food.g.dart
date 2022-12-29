// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      FoodType.fromJson(json['food_type'] as Map<String, dynamic>),
      json['quantity'] as int,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'food_type': instance.foodType,
      'quantity': instance.quantity,
    };
