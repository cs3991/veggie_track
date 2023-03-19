import 'package:json_annotation/json_annotation.dart';
import 'package:pocketbase/pocketbase.dart';

part 'food_type.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FoodType {
  final String id;
  final DateTime created;
  final DateTime updated;
  final String label;
  final double carbonFootprint;
  final String? displayNameFr;
  final String? displayNameEn;

  FoodType({
    required this.id,
    required this.created,
    required this.updated,
    required this.label,
    required this.carbonFootprint,
    required this.displayNameFr,
    required this.displayNameEn,
  });

  factory FoodType.fromJson(Map<String, dynamic> json) => _$FoodTypeFromJson(json);

  factory FoodType.fromRecord(RecordModel record) => FoodType.fromJson(record.data
    ..addAll({
      'id': record.id,
      'created': record.created,
      'updated': record.updated,
    }));

  String toString() {
    return 'FoodType{id: $id,'
        ' created: $created,'
        ' updated: $updated,'
        ' label: $label,'
        ' carbonFootprint: $carbonFootprint,'
        ' displayNameFr: $displayNameFr,'
        ' displayNameEn: $displayNameEn}';
  }
}
