import 'package:isar/isar.dart';

part 'food_type.g.dart';

@collection
class FoodType {
  Id id = Isar.autoIncrement;
  late String label;
  late double carbonFootprint;
  late String displayNameFr;
  late String displayNameEn;

  @override
  String toString() {
    return 'FoodType{id: $id, label: $label, carbonFootprint: $carbonFootprint,'
        ' displayNameFr: $displayNameFr, displayNameEn: $displayNameEn}';
  }
}
