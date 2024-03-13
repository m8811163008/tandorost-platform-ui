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
    r'FoodDataCM': FoodDataCMSchema
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
    r'food': PropertySchema(
      id: 0,
      name: r'food',
      type: IsarType.object,
      target: r'FoodDataCM',
    ),
    r'selectedDate': PropertySchema(
      id: 1,
      name: r'selectedDate',
      type: IsarType.dateTime,
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
      FoodDataCMSchema.estimateSize(
          object.food, allOffsets[FoodDataCM]!, allOffsets);
  return bytesCount;
}

void _selectedFoodCMSerialize(
  SelectedFoodCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<FoodDataCM>(
    offsets[0],
    allOffsets,
    FoodDataCMSchema.serialize,
    object.food,
  );
  writer.writeDateTime(offsets[1], object.selectedDate);
}

SelectedFoodCM _selectedFoodCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedFoodCM();
  object.food = reader.readObjectOrNull<FoodDataCM>(
        offsets[0],
        FoodDataCMSchema.deserialize,
        allOffsets,
      ) ??
      FoodDataCM();
  object.selectedDate = reader.readDateTime(offsets[1]);
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
      return (reader.readObjectOrNull<FoodDataCM>(
            offset,
            FoodDataCMSchema.deserialize,
            allOffsets,
          ) ??
          FoodDataCM()) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SelectedFoodCMQueryFilter
    on QueryBuilder<SelectedFoodCM, SelectedFoodCM, QFilterCondition> {
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
  QueryBuilder<SelectedFoodCM, SelectedFoodCM, QAfterFilterCondition> food(
      FilterQuery<FoodDataCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'food');
    });
  }
}
