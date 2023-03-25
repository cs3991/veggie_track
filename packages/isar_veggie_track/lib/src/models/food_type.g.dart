// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFoodTypeCollection on Isar {
  IsarCollection<FoodType> get foodTypes => this.collection();
}

const FoodTypeSchema = CollectionSchema(
  name: r'FoodType',
  id: 3760478509188011124,
  properties: {
    r'carbonFootprint': PropertySchema(
      id: 0,
      name: r'carbonFootprint',
      type: IsarType.double,
    ),
    r'displayNameEn': PropertySchema(
      id: 1,
      name: r'displayNameEn',
      type: IsarType.string,
    ),
    r'displayNameFr': PropertySchema(
      id: 2,
      name: r'displayNameFr',
      type: IsarType.string,
    ),
    r'distantId': PropertySchema(
      id: 3,
      name: r'distantId',
      type: IsarType.string,
    ),
    r'label': PropertySchema(
      id: 4,
      name: r'label',
      type: IsarType.string,
    )
  },
  estimateSize: _foodTypeEstimateSize,
  serialize: _foodTypeSerialize,
  deserialize: _foodTypeDeserialize,
  deserializeProp: _foodTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _foodTypeGetId,
  getLinks: _foodTypeGetLinks,
  attach: _foodTypeAttach,
  version: '3.0.5',
);

int _foodTypeEstimateSize(
  FoodType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayNameEn.length * 3;
  bytesCount += 3 + object.displayNameFr.length * 3;
  bytesCount += 3 + object.distantId.length * 3;
  bytesCount += 3 + object.label.length * 3;
  return bytesCount;
}

void _foodTypeSerialize(
  FoodType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.carbonFootprint);
  writer.writeString(offsets[1], object.displayNameEn);
  writer.writeString(offsets[2], object.displayNameFr);
  writer.writeString(offsets[3], object.distantId);
  writer.writeString(offsets[4], object.label);
}

FoodType _foodTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodType();
  object.carbonFootprint = reader.readDouble(offsets[0]);
  object.displayNameEn = reader.readString(offsets[1]);
  object.displayNameFr = reader.readString(offsets[2]);
  object.distantId = reader.readString(offsets[3]);
  object.id = id;
  object.label = reader.readString(offsets[4]);
  return object;
}

P _foodTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodTypeGetId(FoodType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodTypeGetLinks(FoodType object) {
  return [];
}

void _foodTypeAttach(IsarCollection<dynamic> col, Id id, FoodType object) {
  object.id = id;
}

extension FoodTypeQueryWhereSort on QueryBuilder<FoodType, FoodType, QWhere> {
  QueryBuilder<FoodType, FoodType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodTypeQueryWhere on QueryBuilder<FoodType, FoodType, QWhereClause> {
  QueryBuilder<FoodType, FoodType, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FoodTypeQueryFilter
    on QueryBuilder<FoodType, FoodType, QFilterCondition> {
  QueryBuilder<FoodType, FoodType, QAfterFilterCondition>
      carbonFootprintEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition>
      carbonFootprintGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition>
      carbonFootprintLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbonFootprint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition>
      carbonFootprintBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbonFootprint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayNameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayNameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayNameEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayNameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayNameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayNameEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayNameEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNameEn',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayNameEn',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNameFr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayNameFr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayNameFr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayNameFr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayNameFr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayNameFr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayNameFr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayNameFr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNameFr',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> displayNameFrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayNameFr',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'distantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'distantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'distantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'distantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distantId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> distantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'distantId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }
}

extension FoodTypeQueryObject
    on QueryBuilder<FoodType, FoodType, QFilterCondition> {}

extension FoodTypeQueryLinks
    on QueryBuilder<FoodType, FoodType, QFilterCondition> {}

extension FoodTypeQuerySortBy on QueryBuilder<FoodType, FoodType, QSortBy> {
  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByCarbonFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByDisplayNameEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameEn', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByDisplayNameEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameEn', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByDisplayNameFr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameFr', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByDisplayNameFrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameFr', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByDistantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distantId', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByDistantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distantId', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }
}

extension FoodTypeQuerySortThenBy
    on QueryBuilder<FoodType, FoodType, QSortThenBy> {
  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByCarbonFootprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carbonFootprint', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByDisplayNameEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameEn', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByDisplayNameEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameEn', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByDisplayNameFr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameFr', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByDisplayNameFrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNameFr', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByDistantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distantId', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByDistantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distantId', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<FoodType, FoodType, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }
}

extension FoodTypeQueryWhereDistinct
    on QueryBuilder<FoodType, FoodType, QDistinct> {
  QueryBuilder<FoodType, FoodType, QDistinct> distinctByCarbonFootprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carbonFootprint');
    });
  }

  QueryBuilder<FoodType, FoodType, QDistinct> distinctByDisplayNameEn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayNameEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodType, FoodType, QDistinct> distinctByDisplayNameFr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayNameFr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodType, FoodType, QDistinct> distinctByDistantId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distantId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodType, FoodType, QDistinct> distinctByLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }
}

extension FoodTypeQueryProperty
    on QueryBuilder<FoodType, FoodType, QQueryProperty> {
  QueryBuilder<FoodType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodType, double, QQueryOperations> carbonFootprintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carbonFootprint');
    });
  }

  QueryBuilder<FoodType, String, QQueryOperations> displayNameEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayNameEn');
    });
  }

  QueryBuilder<FoodType, String, QQueryOperations> displayNameFrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayNameFr');
    });
  }

  QueryBuilder<FoodType, String, QQueryOperations> distantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distantId');
    });
  }

  QueryBuilder<FoodType, String, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }
}
