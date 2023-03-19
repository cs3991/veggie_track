// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodType _$FoodTypeFromJson(Map<String, dynamic> json) => FoodType(
      id: json['id'] as String,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      label: json['label'] as String,
      carbonFootprint: (json['carbon_footprint'] as num).toDouble(),
      displayNameFr: json['display_name_fr'] as String?,
      displayNameEn: json['display_name_en'] as String?,
    );

Map<String, dynamic> _$FoodTypeToJson(FoodType instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'label': instance.label,
      'carbon_footprint': instance.carbonFootprint,
      'display_name_fr': instance.displayNameFr,
      'display_name_en': instance.displayNameEn,
    };
