import 'package:flutter_test/flutter_test.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_veggie_track/pocketbase_veggie_track.dart';

void main() {
  test('FoodType fromJson', () async {
    expect(
        FoodType.fromJson({
          "id": "RECORD_ID",
          "collectionId": "xw6zodnjvqfae2l",
          "collectionName": "food_types",
          "created": "2022-01-01 01:00:00.123Z",
          "updated": "2022-01-01 23:59:59.456Z",
          "label": "testlabel",
          "carbon_footprint": 123,
          "display_name_fr": "testfr",
          "display_name_en": "testen"
        }),
        isA<FoodType>()
            .having((foodType) => foodType.id, 'id', 'RECORD_ID')
            .having((foodType) => foodType.created, 'created', DateTime.parse('2022-01-01 01:00:00.123Z'))
            .having((foodType) => foodType.updated, 'updated', DateTime.parse('2022-01-01 23:59:59.456Z'))
            .having((foodType) => foodType.label, 'label', 'testlabel')
            .having((foodType) => foodType.carbonFootprint, 'carbonFootprint', 123)
            .having((foodType) => foodType.displayNameFr, 'displayNameFr', 'testfr')
            .having((foodType) => foodType.displayNameEn, 'displayNameEn', 'testen'));
  });

  test('FoodType fromRecord', () async {
    expect(
        FoodType.fromRecord(RecordModel(
            id: 'RECORD_ID',
            collectionId: 'xw6zodnjvqfae2l',
            collectionName: 'food_types',
            created: '2022-01-01 01:00:00.123Z',
            updated: '2022-01-01 23:59:59.456Z',
            data: {
              "label": "testlabel",
              "carbon_footprint": 123,
              "display_name_fr": "testfr",
              "display_name_en": "testen"
            })),
        isA<FoodType>()
            .having((foodType) => foodType.id, 'id', 'RECORD_ID')
            .having((foodType) => foodType.created, 'created', DateTime.parse('2022-01-01 01:00:00.123Z'))
            .having((foodType) => foodType.updated, 'updated', DateTime.parse('2022-01-01 23:59:59.456Z'))
            .having((foodType) => foodType.label, 'label', 'testlabel')
            .having((foodType) => foodType.carbonFootprint, 'carbonFootprint', 123)
            .having((foodType) => foodType.displayNameFr, 'displayNameFr', 'testfr')
            .having((foodType) => foodType.displayNameEn, 'displayNameEn', 'testen'));
  });
}
