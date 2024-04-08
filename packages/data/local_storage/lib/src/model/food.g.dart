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
    r'calorie': PropertySchema(
      id: 0,
      name: r'calorie',
      type: IsarType.long,
    ),
    r'gramsPerUnit': PropertySchema(
      id: 1,
      name: r'gramsPerUnit',
      type: IsarType.long,
    ),
    r'isVegetable': PropertySchema(
      id: 2,
      name: r'isVegetable',
      type: IsarType.bool,
    ),
    r'macroNutrition': PropertySchema(
      id: 3,
      name: r'macroNutrition',
      type: IsarType.object,
      target: r'MacroNutritionCM',
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _foodCMEstimateSize,
  serialize: _foodCMSerialize,
  deserialize: _foodCMDeserialize,
  deserializeProp: _foodCMDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'MacroNutritionCM': MacroNutritionCMSchema},
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
      MacroNutritionCMSchema.estimateSize(
          object.macroNutrition, allOffsets[MacroNutritionCM]!, allOffsets);
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _foodCMSerialize(
  FoodCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calorie);
  writer.writeLong(offsets[1], object.gramsPerUnit);
  writer.writeBool(offsets[2], object.isVegetable);
  writer.writeObject<MacroNutritionCM>(
    offsets[3],
    allOffsets,
    MacroNutritionCMSchema.serialize,
    object.macroNutrition,
  );
  writer.writeString(offsets[4], object.name);
}

FoodCM _foodCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodCM();
  object.calorie = reader.readLongOrNull(offsets[0]);
  object.gramsPerUnit = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.isVegetable = reader.readBoolOrNull(offsets[2]);
  object.macroNutrition = reader.readObjectOrNull<MacroNutritionCM>(
        offsets[3],
        MacroNutritionCMSchema.deserialize,
        allOffsets,
      ) ??
      MacroNutritionCM();
  object.name = reader.readStringOrNull(offsets[4]);
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
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<MacroNutritionCM>(
            offset,
            MacroNutritionCMSchema.deserialize,
            allOffsets,
          ) ??
          MacroNutritionCM()) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
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
  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> calorieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calorie',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> calorieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calorie',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> calorieEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calorie',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> calorieGreaterThan(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> calorieLessThan(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> calorieBetween(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> gramsPerUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gramsPerUnit',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> gramsPerUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gramsPerUnit',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> gramsPerUnitEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gramsPerUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> gramsPerUnitGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gramsPerUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> gramsPerUnitLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gramsPerUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> gramsPerUnitBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gramsPerUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> isVegetableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isVegetable',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> isVegetableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isVegetable',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> isVegetableEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVegetable',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameEqualTo(
    String? value, {
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameGreaterThan(
    String? value, {
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameLessThan(
    String? value, {
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FoodCMQueryObject on QueryBuilder<FoodCM, FoodCM, QFilterCondition> {
  QueryBuilder<FoodCM, FoodCM, QAfterFilterCondition> macroNutrition(
      FilterQuery<MacroNutritionCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'macroNutrition');
    });
  }
}

extension FoodCMQueryLinks on QueryBuilder<FoodCM, FoodCM, QFilterCondition> {}

extension FoodCMQuerySortBy on QueryBuilder<FoodCM, FoodCM, QSortBy> {
  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByCalorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calorie', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByCalorieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calorie', Sort.desc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByGramsPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByGramsPerUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.desc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByIsVegetable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVegetable', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByIsVegetableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVegetable', Sort.desc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FoodCMQuerySortThenBy on QueryBuilder<FoodCM, FoodCM, QSortThenBy> {
  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByCalorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calorie', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByCalorieDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calorie', Sort.desc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByGramsPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByGramsPerUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.desc);
    });
  }

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

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByIsVegetable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVegetable', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByIsVegetableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVegetable', Sort.desc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodCM, FoodCM, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FoodCMQueryWhereDistinct on QueryBuilder<FoodCM, FoodCM, QDistinct> {
  QueryBuilder<FoodCM, FoodCM, QDistinct> distinctByCalorie() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calorie');
    });
  }

  QueryBuilder<FoodCM, FoodCM, QDistinct> distinctByGramsPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gramsPerUnit');
    });
  }

  QueryBuilder<FoodCM, FoodCM, QDistinct> distinctByIsVegetable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVegetable');
    });
  }

  QueryBuilder<FoodCM, FoodCM, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension FoodCMQueryProperty on QueryBuilder<FoodCM, FoodCM, QQueryProperty> {
  QueryBuilder<FoodCM, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodCM, int?, QQueryOperations> calorieProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calorie');
    });
  }

  QueryBuilder<FoodCM, int?, QQueryOperations> gramsPerUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gramsPerUnit');
    });
  }

  QueryBuilder<FoodCM, bool?, QQueryOperations> isVegetableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVegetable');
    });
  }

  QueryBuilder<FoodCM, MacroNutritionCM, QQueryOperations>
      macroNutritionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'macroNutrition');
    });
  }

  QueryBuilder<FoodCM, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MacroNutritionCMSchema = Schema(
  name: r'MacroNutritionCM',
  id: -6086334516070408658,
  properties: {
    r'carbohydrate': PropertySchema(
      id: 0,
      name: r'carbohydrate',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 1,
      name: r'fat',
      type: IsarType.double,
    ),
    r'protein': PropertySchema(
      id: 2,
      name: r'protein',
      type: IsarType.double,
    )
  },
  estimateSize: _macroNutritionCMEstimateSize,
  serialize: _macroNutritionCMSerialize,
  deserialize: _macroNutritionCMDeserialize,
  deserializeProp: _macroNutritionCMDeserializeProp,
);

int _macroNutritionCMEstimateSize(
  MacroNutritionCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _macroNutritionCMSerialize(
  MacroNutritionCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.carbohydrate);
  writer.writeDouble(offsets[1], object.fat);
  writer.writeDouble(offsets[2], object.protein);
}

MacroNutritionCM _macroNutritionCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MacroNutritionCM();
  object.carbohydrate = reader.readDoubleOrNull(offsets[0]);
  object.fat = reader.readDoubleOrNull(offsets[1]);
  object.protein = reader.readDoubleOrNull(offsets[2]);
  return object;
}

P _macroNutritionCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MacroNutritionCMQueryFilter
    on QueryBuilder<MacroNutritionCM, MacroNutritionCM, QFilterCondition> {
  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      carbohydrateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carbohydrate',
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      carbohydrateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carbohydrate',
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      carbohydrateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbohydrate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      carbohydrateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbohydrate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      carbohydrateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbohydrate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      carbohydrateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbohydrate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      fatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fat',
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      fatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fat',
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      fatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      fatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      fatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      fatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      proteinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'protein',
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      proteinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'protein',
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      proteinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      proteinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      proteinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MacroNutritionCM, MacroNutritionCM, QAfterFilterCondition>
      proteinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MacroNutritionCMQueryObject
    on QueryBuilder<MacroNutritionCM, MacroNutritionCM, QFilterCondition> {}
