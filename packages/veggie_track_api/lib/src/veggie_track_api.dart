import 'package:veggie_track_api/src/models/models.dart';

abstract class VeggieTrackApi {
  Future<List<Day>> getMealsOfMonth(int year, int month);

  Future<void> saveMeal(DateTime date, List<Food> foods);
}
