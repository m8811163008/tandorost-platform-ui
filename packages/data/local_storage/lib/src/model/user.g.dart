// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCMCollection on Isar {
  IsarCollection<UserCM> get userCMs => this.collection();
}

const UserCMSchema = CollectionSchema(
  name: r'UserCM',
  id: -2537570548217915368,
  properties: {
    r'selectedFoods': PropertySchema(
      id: 0,
      name: r'selectedFoods',
      type: IsarType.objectList,
      target: r'SelectedFoodCM',
    )
  },
  estimateSize: _userCMEstimateSize,
  serialize: _userCMSerialize,
  deserialize: _userCMDeserialize,
  deserializeProp: _userCMDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'SelectedFoodCM': SelectedFoodCMSchema,
    r'MacroNutritionCM': MacroNutritionCMSchema,
    r'UnitOfMeasurmentCM': UnitOfMeasurmentCMSchema
  },
  getId: _userCMGetId,
  getLinks: _userCMGetLinks,
  attach: _userCMAttach,
  version: '3.1.0+1',
);

int _userCMEstimateSize(
  UserCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.selectedFoods.length * 3;
  {
    final offsets = allOffsets[SelectedFoodCM]!;
    for (var i = 0; i < object.selectedFoods.length; i++) {
      final value = object.selectedFoods[i];
      bytesCount +=
          SelectedFoodCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _userCMSerialize(
  UserCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<SelectedFoodCM>(
    offsets[0],
    allOffsets,
    SelectedFoodCMSchema.serialize,
    object.selectedFoods,
  );
}

UserCM _userCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserCM();
  object.id = id;
  object.selectedFoods = reader.readObjectList<SelectedFoodCM>(
        offsets[0],
        SelectedFoodCMSchema.deserialize,
        allOffsets,
        SelectedFoodCM(),
      ) ??
      [];
  return object;
}

P _userCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<SelectedFoodCM>(
            offset,
            SelectedFoodCMSchema.deserialize,
            allOffsets,
            SelectedFoodCM(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userCMGetId(UserCM object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userCMGetLinks(UserCM object) {
  return [];
}

void _userCMAttach(IsarCollection<dynamic> col, Id id, UserCM object) {
  object.id = id;
}

extension UserCMQueryWhereSort on QueryBuilder<UserCM, UserCM, QWhere> {
  QueryBuilder<UserCM, UserCM, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserCMQueryWhere on QueryBuilder<UserCM, UserCM, QWhereClause> {
  QueryBuilder<UserCM, UserCM, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserCM, UserCM, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterWhereClause> idBetween(
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

extension UserCMQueryFilter on QueryBuilder<UserCM, UserCM, QFilterCondition> {
  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition>
      selectedFoodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedFoods',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> selectedFoodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedFoods',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition>
      selectedFoodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedFoods',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition>
      selectedFoodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedFoods',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition>
      selectedFoodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedFoods',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterFilterCondition>
      selectedFoodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'selectedFoods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension UserCMQueryObject on QueryBuilder<UserCM, UserCM, QFilterCondition> {
  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> selectedFoodsElement(
      FilterQuery<SelectedFoodCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'selectedFoods');
    });
  }
}

extension UserCMQueryLinks on QueryBuilder<UserCM, UserCM, QFilterCondition> {}

extension UserCMQuerySortBy on QueryBuilder<UserCM, UserCM, QSortBy> {}

extension UserCMQuerySortThenBy on QueryBuilder<UserCM, UserCM, QSortThenBy> {
  QueryBuilder<UserCM, UserCM, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserCM, UserCM, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension UserCMQueryWhereDistinct on QueryBuilder<UserCM, UserCM, QDistinct> {}

extension UserCMQueryProperty on QueryBuilder<UserCM, UserCM, QQueryProperty> {
  QueryBuilder<UserCM, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserCM, List<SelectedFoodCM>, QQueryOperations>
      selectedFoodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedFoods');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SelectedFoodCMSchema = Schema(
  name: r'SelectedFoodCM',
  id: -3216707772304739627,
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
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
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
    ),
    r'numberOfUnits': PropertySchema(
      id: 5,
      name: r'numberOfUnits',
      type: IsarType.long,
    ),
    r'selectedDate': PropertySchema(
      id: 6,
      name: r'selectedDate',
      type: IsarType.dateTime,
    ),
    r'unitOfMeasurment': PropertySchema(
      id: 7,
      name: r'unitOfMeasurment',
      type: IsarType.object,
      target: r'UnitOfMeasurmentCM',
    )
  },
  estimateSize: _selectedFoodCMEstimateSize,
  serialize: _selectedFoodCMSerialize,
  deserialize: _selectedFoodCMDeserialize,
  deserializeProp: _selectedFoodCMDeserializeProp,
);

int _selectedFoodCMEstimateSize(
  SelectedFoodCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.macroNutrition;
    if (value != null) {
      bytesCount += 3 +
          MacroNutritionCMSchema.estimateSize(
              value, allOffsets[MacroNutritionCM]!, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      UnitOfMeasurmentCMSchema.estimateSize(
          object.unitOfMeasurment, allOffsets[UnitOfMeasurmentCM]!, allOffsets);
  return bytesCount;
}

void _selectedFoodCMSerialize(
  SelectedFoodCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calorie);
  writer.writeLong(offsets[1], object.gramsPerUnit);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeObject<MacroNutritionCM>(
    offsets[3],
    allOffsets,
    MacroNutritionCMSchema.serialize,
    object.macroNutrition,
  );
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.numberOfUnits);
  writer.writeDateTime(offsets[6], object.selectedDate);
  writer.writeObject<UnitOfMeasurmentCM>(
    offsets[7],
    allOffsets,
    UnitOfMeasurmentCMSchema.serialize,
    object.unitOfMeasurment,
  );
}

SelectedFoodCM _selectedFoodCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedFoodCM();
  object.calorie = reader.readLongOrNull(offsets[0]);
  object.gramsPerUnit = reader.readLongOrNull(offsets[1]);
  object.macroNutrition = reader.readObjectOrNull<MacroNutritionCM>(
    offsets[3],
    MacroNutritionCMSchema.deserialize,
    allOffsets,
  );
  object.name = reader.readString(offsets[4]);
  object.numberOfUnits = reader.readLong(offsets[5]);
  object.selectedDate = reader.readDateTime(offsets[6]);
  object.unitOfMeasurment = reader.readObjectOrNull<UnitOfMeasurmentCM>(
        offsets[7],
        UnitOfMeasurmentCMSchema.deserialize,
        allOffsets,
      ) ??
      UnitOfMeasurmentCM();
  return object;
}

P _selectedFoodCMDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<MacroNutritionCM>(
        offset,
        MacroNutritionCMSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<UnitOfMeasurmentCM>(
            offset,
            UnitOfMeasurmentCMSchema.deserialize,
            allOffsets,
          ) ??
          UnitOfMeasurmentCM()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SelectedFoodCMQueryFilter
    on QueryBuilder<SelectedFoodCM, SelectedFoodCM, QFilterCondition> {
  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      calorieIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calorie',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      calorieIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calorie',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      calorieEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calorie',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      calorieLessThan(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      calorieBetween(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gramsPerUnit',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gramsPerUnit',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gramsPerUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitGreaterThan(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitLessThan(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitBetween(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      macroNutritionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'macroNutrition',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      macroNutritionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'macroNutrition',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      numberOfUnitsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      numberOfUnitsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      numberOfUnitsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfUnits',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      numberOfUnitsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      selectedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      selectedDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      selectedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      selectedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SelectedFoodCMQueryObject
    on QueryBuilder<SelectedFoodCM, SelectedFoodCM, QFilterCondition> {
  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      macroNutrition(FilterQuery<MacroNutritionCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'macroNutrition');
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      unitOfMeasurment(FilterQuery<UnitOfMeasurmentCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'unitOfMeasurment');
    });
  }
}
