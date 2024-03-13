// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodCMCollection on Isar {
  IsarCollection<FoodCM> get foodCMs => this.collection();
}

const FoodCMSchema = CollectionSchema(
  name: r'FoodCM',
  id: 7942962076487121710,
  properties: {
    r'foodDataCM': PropertySchema(
      id: 0,
      name: r'foodDataCM',
      type: IsarType.object,
      target: r'FoodDataCM',
    )
  },
  estimateSize: _foodCMEstimateSize,
  serialize: _foodCMSerialize,
  deserialize: _foodCMDeserialize,
  deserializeProp: _foodCMDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'FoodDataCM': FoodDataCMSchema},
  getId: _foodCMGetId,
  getLinks: _foodCMGetLinks,
  attach: _foodCMAttach,
  version: '3.1.0+1',
);

int _foodCMEstimateSize(
  FoodCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      FoodDataCMSchema.estimateSize(
          object.foodDataCM, allOffsets[FoodDataCM]!, allOffsets);
  return bytesCount;
}

void _foodCMSerialize(
  FoodCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<FoodDataCM>(
    offsets[0],
    allOffsets,
    FoodDataCMSchema.serialize,
    object.foodDataCM,
  );
}

FoodCM _foodCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodCM();
  object.foodDataCM = reader.readObjectOrNull<FoodDataCM>(
        offsets[0],
        FoodDataCMSchema.deserialize,
        allOffsets,
      ) ??
      FoodDataCM();
  object.id = id;
  return object;
}

P _foodCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<FoodDataCM>(
            offset,
            FoodDataCMSchema.deserialize,
            allOffsets,
          ) ??
          FoodDataCM()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodCMGetId(FoodCM object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodCMGetLinks(FoodCM object) {
  return [];
}

void _foodCMAttach(IsarCollection<dynamic> col, Id id, FoodCM object) {
  object.id = id;
}

extension FoodCMQueryWhereSort on QueryBuilder<FoodCM, FoodCM, QWhere> {
  QueryBuilder<FoodCM, FoodCM, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodCMQueryWhere on QueryBuilder<FoodCM, FoodCM, QWhereClause> {
  QueryBuilder<FoodCM, FoodCM, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FoodCM, FoodCM, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterWhereClause> idBetween(
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

extension FoodCMQueryFilter on QueryBuilder<FoodCM, FoodCM, QFilterCondition> {
  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> idBetween(
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
}

extension FoodCMQueryObject on QueryBuilder<FoodCM, FoodCM, QFilterCondition> {
  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> foodDataCM(
      FilterQuery<FoodDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'foodDataCM');
    });
  }
}

extension FoodCMQueryLinks on QueryBuilder<FoodCM, FoodCM, QFilterCondition> {}

extension FoodCMQuerySortBy on QueryBuilder<FoodCM, FoodCM, QSortBy> {}

extension FoodCMQuerySortThenBy on QueryBuilder<FoodCM, FoodCM, QSortThenBy> {
  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FoodCMQueryWhereDistinct on QueryBuilder<FoodCM, FoodCM, QDistinct> {}

extension FoodCMQueryProperty on QueryBuilder<FoodCM, FoodCM, QQueryProperty> {
  QueryBuilder<FoodCM, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodCM, FoodDataCM, QQueryOperations> foodDataCMProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodDataCM');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FoodDataCMSchema = Schema(
  name: r'FoodDataCM',
  id: -2521534375543972788,
  properties: {
    r'calorie': PropertySchema(
      id: 0,
      name: r'calorie',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _foodDataCMEstimateSize,
  serialize: _foodDataCMSerialize,
  deserialize: _foodDataCMDeserialize,
  deserializeProp: _foodDataCMDeserializeProp,
);

int _foodDataCMEstimateSize(
  FoodDataCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _foodDataCMSerialize(
  FoodDataCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calorie);
  writer.writeString(offsets[1], object.name);
}

FoodDataCM _foodDataCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodDataCM();
  object.calorie = reader.readLongOrNull(offsets[0]);
  object.name = reader.readString(offsets[1]);
  return object;
}

P _foodDataCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FoodDataCMQueryFilter
    on QueryBuilder<FoodDataCM, FoodDataCM, QFilterCondition> {
  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> calorieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calorie',
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition>
      calorieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calorie',
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> calorieEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calorie',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition>
      calorieGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calorie',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> calorieLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calorie',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> calorieBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calorie',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodDataCM, FoodDataCM, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FoodDataCMQueryObject
    on QueryBuilder<FoodDataCM, FoodDataCM, QFilterCondition> {}
