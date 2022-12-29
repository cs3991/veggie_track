import 'package:isar/isar.dart';

part 'food_type.g.dart';

@collection
class FoodType {
  Id id = Isar.autoIncrement;
  late String label;
  late double carbonFootprint;
}
