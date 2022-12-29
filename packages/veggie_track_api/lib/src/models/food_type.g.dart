// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodType _$FoodTypeFromJson(Map<String, dynamic> json) => FoodType(
      label: json['label'] as String,
      carbonFootprint: (json['carbon_footprint'] as num).toDouble(),
    );

Map<String, dynamic> _$FoodTypeToJson(FoodType instance) => <String, dynamic>{
      'label': instance.label,
      'carbon_footprint': instance.carbonFootprint,
    };
