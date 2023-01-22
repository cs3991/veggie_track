// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      DateTime.parse(json['date'] as String),
      (json['lunch'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['diner'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'lunch': instance.lunch,
      'diner': instance.diner,
    };
