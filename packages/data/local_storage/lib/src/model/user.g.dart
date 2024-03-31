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
    r'profileCM': PropertySchema(
      id: 0,
      name: r'profileCM',
      type: IsarType.object,
      target: r'ProfileCM',
    ),
    r'selectedFoods': PropertySchema(
      id: 1,
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
    r'UnitOfMeasurmentCM': UnitOfMeasurmentCMSchema,
    r'ProfileCM': ProfileCMSchema,
    r'BodyCompositionCM': BodyCompositionCMSchema,
    r'BioDataCM': BioDataCMSchema
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
  bytesCount += 3 +
      ProfileCMSchema.estimateSize(
          object.profileCM, allOffsets[ProfileCM]!, allOffsets);
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
  writer.writeObject<ProfileCM>(
    offsets[0],
    allOffsets,
    ProfileCMSchema.serialize,
    object.profileCM,
  );
  writer.writeObjectList<SelectedFoodCM>(
    offsets[1],
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
  object.profileCM = reader.readObjectOrNull<ProfileCM>(
        offsets[0],
        ProfileCMSchema.deserialize,
        allOffsets,
      ) ??
      ProfileCM();
  object.selectedFoods = reader.readObjectList<SelectedFoodCM>(
        offsets[1],
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
      return (reader.readObjectOrNull<ProfileCM>(
            offset,
            ProfileCMSchema.deserialize,
            allOffsets,
          ) ??
          ProfileCM()) as P;
    case 1:
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
  QueryBuilder<UserCM, UserCM, QAfterFilterCondition> profileCM(
      FilterQuery<ProfileCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'profileCM');
    });
  }

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

  QueryBuilder<UserCM, ProfileCM, QQueryOperations> profileCMProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileCM');
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
    r'unitOfMeasurmentCM': PropertySchema(
      id: 7,
      name: r'unitOfMeasurmentCM',
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
  bytesCount += 3 +
      MacroNutritionCMSchema.estimateSize(
          object.macroNutrition, allOffsets[MacroNutritionCM]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      UnitOfMeasurmentCMSchema.estimateSize(object.unitOfMeasurmentCM,
          allOffsets[UnitOfMeasurmentCM]!, allOffsets);
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
    object.unitOfMeasurmentCM,
  );
}

SelectedFoodCM _selectedFoodCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedFoodCM();
  object.calorie = reader.readLong(offsets[0]);
  object.gramsPerUnit = reader.readLong(offsets[1]);
  object.macroNutrition = reader.readObjectOrNull<MacroNutritionCM>(
        offsets[3],
        MacroNutritionCMSchema.deserialize,
        allOffsets,
      ) ??
      MacroNutritionCM();
  object.name = reader.readString(offsets[4]);
  object.numberOfUnits = reader.readLong(offsets[5]);
  object.selectedDate = reader.readDateTime(offsets[6]);
  object.unitOfMeasurmentCM = reader.readObjectOrNull<UnitOfMeasurmentCM>(
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<MacroNutritionCM>(
            offset,
            MacroNutritionCMSchema.deserialize,
            allOffsets,
          ) ??
          MacroNutritionCM()) as P;
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
      calorieEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calorie',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      calorieGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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
      gramsPerUnitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gramsPerUnit',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition>
      gramsPerUnitGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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
      unitOfMeasurmentCM(FilterQuery<UnitOfMeasurmentCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'unitOfMeasurmentCM');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProfileCMSchema = Schema(
  name: r'ProfileCM',
  id: -857390734216383499,
  properties: {
    r'birthday': PropertySchema(
      id: 0,
      name: r'birthday',
      type: IsarType.dateTime,
    ),
    r'bodyComposition': PropertySchema(
      id: 1,
      name: r'bodyComposition',
      type: IsarType.object,
      target: r'BodyCompositionCM',
    ),
    r'isMale': PropertySchema(
      id: 2,
      name: r'isMale',
      type: IsarType.bool,
    ),
    r'userName': PropertySchema(
      id: 3,
      name: r'userName',
      type: IsarType.string,
    )
  },
  estimateSize: _profileCMEstimateSize,
  serialize: _profileCMSerialize,
  deserialize: _profileCMDeserialize,
  deserializeProp: _profileCMDeserializeProp,
);

int _profileCMEstimateSize(
  ProfileCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bodyComposition;
    if (value != null) {
      bytesCount += 3 +
          BodyCompositionCMSchema.estimateSize(
              value, allOffsets[BodyCompositionCM]!, allOffsets);
    }
  }
  bytesCount += 3 + object.userName.length * 3;
  return bytesCount;
}

void _profileCMSerialize(
  ProfileCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.birthday);
  writer.writeObject<BodyCompositionCM>(
    offsets[1],
    allOffsets,
    BodyCompositionCMSchema.serialize,
    object.bodyComposition,
  );
  writer.writeBool(offsets[2], object.isMale);
  writer.writeString(offsets[3], object.userName);
}

ProfileCM _profileCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProfileCM();
  object.birthday = reader.readDateTimeOrNull(offsets[0]);
  object.bodyComposition = reader.readObjectOrNull<BodyCompositionCM>(
    offsets[1],
    BodyCompositionCMSchema.deserialize,
    allOffsets,
  );
  object.isMale = reader.readBoolOrNull(offsets[2]);
  object.userName = reader.readString(offsets[3]);
  return object;
}

P _profileCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<BodyCompositionCM>(
        offset,
        BodyCompositionCMSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProfileCMQueryFilter
    on QueryBuilder<ProfileCM, ProfileCM, QFilterCondition> {
  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> birthdayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthday',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition>
      birthdayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthday',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> birthdayEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthday',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> birthdayGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthday',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> birthdayLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthday',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> birthdayBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition>
      bodyCompositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bodyComposition',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition>
      bodyCompositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bodyComposition',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> isMaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMale',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> isMaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMale',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> isMaleEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMale',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition>
      userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }
}

extension ProfileCMQueryObject
    on QueryBuilder<ProfileCM, ProfileCM, QFilterCondition> {
  QueryBuilder<ProfileCM, ProfileCM, QAfterFilterCondition> bodyComposition(
      FilterQuery<BodyCompositionCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bodyComposition');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BodyCompositionCMSchema = Schema(
  name: r'BodyCompositionCM',
  id: -1595502616956810877,
  properties: {
    r'armCircumference': PropertySchema(
      id: 0,
      name: r'armCircumference',
      type: IsarType.objectList,
      target: r'BioDataCM',
    ),
    r'calfMuscleCircumference': PropertySchema(
      id: 1,
      name: r'calfMuscleCircumference',
      type: IsarType.objectList,
      target: r'BioDataCM',
    ),
    r'chestCircumference': PropertySchema(
      id: 2,
      name: r'chestCircumference',
      type: IsarType.objectList,
      target: r'BioDataCM',
    ),
    r'height': PropertySchema(
      id: 3,
      name: r'height',
      type: IsarType.objectList,
      target: r'BioDataCM',
    ),
    r'thightCircumference': PropertySchema(
      id: 4,
      name: r'thightCircumference',
      type: IsarType.objectList,
      target: r'BioDataCM',
    ),
    r'waistCircumference': PropertySchema(
      id: 5,
      name: r'waistCircumference',
      type: IsarType.objectList,
      target: r'BioDataCM',
    ),
    r'weight': PropertySchema(
      id: 6,
      name: r'weight',
      type: IsarType.objectList,
      target: r'BioDataCM',
    )
  },
  estimateSize: _bodyCompositionCMEstimateSize,
  serialize: _bodyCompositionCMSerialize,
  deserialize: _bodyCompositionCMDeserialize,
  deserializeProp: _bodyCompositionCMDeserializeProp,
);

int _bodyCompositionCMEstimateSize(
  BodyCompositionCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.armCircumference.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.armCircumference.length; i++) {
      final value = object.armCircumference[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.calfMuscleCircumference.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.calfMuscleCircumference.length; i++) {
      final value = object.calfMuscleCircumference[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.chestCircumference.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.chestCircumference.length; i++) {
      final value = object.chestCircumference[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.height.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.height.length; i++) {
      final value = object.height[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.thightCircumference.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.thightCircumference.length; i++) {
      final value = object.thightCircumference[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.waistCircumference.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.waistCircumference.length; i++) {
      final value = object.waistCircumference[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.weight.length * 3;
  {
    final offsets = allOffsets[BioDataCM]!;
    for (var i = 0; i < object.weight.length; i++) {
      final value = object.weight[i];
      bytesCount += BioDataCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _bodyCompositionCMSerialize(
  BodyCompositionCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<BioDataCM>(
    offsets[0],
    allOffsets,
    BioDataCMSchema.serialize,
    object.armCircumference,
  );
  writer.writeObjectList<BioDataCM>(
    offsets[1],
    allOffsets,
    BioDataCMSchema.serialize,
    object.calfMuscleCircumference,
  );
  writer.writeObjectList<BioDataCM>(
    offsets[2],
    allOffsets,
    BioDataCMSchema.serialize,
    object.chestCircumference,
  );
  writer.writeObjectList<BioDataCM>(
    offsets[3],
    allOffsets,
    BioDataCMSchema.serialize,
    object.height,
  );
  writer.writeObjectList<BioDataCM>(
    offsets[4],
    allOffsets,
    BioDataCMSchema.serialize,
    object.thightCircumference,
  );
  writer.writeObjectList<BioDataCM>(
    offsets[5],
    allOffsets,
    BioDataCMSchema.serialize,
    object.waistCircumference,
  );
  writer.writeObjectList<BioDataCM>(
    offsets[6],
    allOffsets,
    BioDataCMSchema.serialize,
    object.weight,
  );
}

BodyCompositionCM _bodyCompositionCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BodyCompositionCM();
  object.armCircumference = reader.readObjectList<BioDataCM>(
        offsets[0],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  object.calfMuscleCircumference = reader.readObjectList<BioDataCM>(
        offsets[1],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  object.chestCircumference = reader.readObjectList<BioDataCM>(
        offsets[2],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  object.height = reader.readObjectList<BioDataCM>(
        offsets[3],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  object.thightCircumference = reader.readObjectList<BioDataCM>(
        offsets[4],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  object.waistCircumference = reader.readObjectList<BioDataCM>(
        offsets[5],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  object.weight = reader.readObjectList<BioDataCM>(
        offsets[6],
        BioDataCMSchema.deserialize,
        allOffsets,
        BioDataCM(),
      ) ??
      [];
  return object;
}

P _bodyCompositionCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    case 1:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    case 2:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    case 4:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    case 5:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    case 6:
      return (reader.readObjectList<BioDataCM>(
            offset,
            BioDataCMSchema.deserialize,
            allOffsets,
            BioDataCM(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BodyCompositionCMQueryFilter
    on QueryBuilder<BodyCompositionCM, BodyCompositionCM, QFilterCondition> {
  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'armCircumference',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'armCircumference',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'armCircumference',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'armCircumference',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'armCircumference',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'armCircumference',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calfMuscleCircumference',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calfMuscleCircumference',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calfMuscleCircumference',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calfMuscleCircumference',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calfMuscleCircumference',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'calfMuscleCircumference',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chestCircumference',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chestCircumference',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chestCircumference',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chestCircumference',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chestCircumference',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chestCircumference',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'height',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'height',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'height',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'height',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'height',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'height',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thightCircumference',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thightCircumference',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thightCircumference',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thightCircumference',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thightCircumference',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thightCircumference',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waistCircumference',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waistCircumference',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waistCircumference',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waistCircumference',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waistCircumference',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'waistCircumference',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weight',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension BodyCompositionCMQueryObject
    on QueryBuilder<BodyCompositionCM, BodyCompositionCM, QFilterCondition> {
  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      armCircumferenceElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'armCircumference');
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      calfMuscleCircumferenceElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'calfMuscleCircumference');
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      chestCircumferenceElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'chestCircumference');
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      heightElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'height');
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      thightCircumferenceElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'thightCircumference');
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      waistCircumferenceElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'waistCircumference');
    });
  }

  QueryBuilder<BodyCompositionCM, BodyCompositionCM, QAfterFilterCondition>
      weightElement(FilterQuery<BioDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weight');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BioDataCMSchema = Schema(
  name: r'BioDataCM',
  id: 7845649999086265851,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'logDate': PropertySchema(
      id: 1,
      name: r'logDate',
      type: IsarType.dateTime,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _bioDataCMEstimateSize,
  serialize: _bioDataCMSerialize,
  deserialize: _bioDataCMDeserialize,
  deserializeProp: _bioDataCMDeserializeProp,
);

int _bioDataCMEstimateSize(
  BioDataCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bioDataCMSerialize(
  BioDataCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeDateTime(offsets[1], object.logDate);
  writer.writeDouble(offsets[2], object.value);
}

BioDataCM _bioDataCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BioDataCM();
  object.logDate = reader.readDateTime(offsets[1]);
  object.value = reader.readDouble(offsets[2]);
  return object;
}

P _bioDataCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BioDataCMQueryFilter
    on QueryBuilder<BioDataCM, BioDataCM, QFilterCondition> {
  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> logDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> logDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> logDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> logDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BioDataCM, BioDataCM, QAfterFilterCondition> valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BioDataCMQueryObject
    on QueryBuilder<BioDataCM, BioDataCM, QFilterCondition> {}
