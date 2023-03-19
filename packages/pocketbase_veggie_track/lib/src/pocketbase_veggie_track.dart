import 'package:pocketbase/pocketbase.dart';

import 'models/models.dart';

class PocketBaseVeggieTrack {
  final pb = PocketBase('https://veggietrack.guillaumeclaverie.com');

  Future<List<FoodType>> getFoodTypes() async {
    final records = await pb.collection('food_types').getFullList();
    var result = <FoodType>[];
    for (var record in records) {
      result.add(FoodType.fromRecord(record));
    }
    return result;
  }
}
