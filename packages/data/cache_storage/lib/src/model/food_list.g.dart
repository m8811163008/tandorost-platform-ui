// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodListCMCollection on Isar {
  IsarCollection<FoodListCM> get foodListCMs => this.collection();
}

const FoodListCMSchema = CollectionSchema(
  name: r'FoodListCM',
  id: -5809859662476202366,
  properties: {
    r'foods': PropertySchema(
      id: 0,
      name: r'foods',
      type: IsarType.objectList,
      target: r'FoodStaticticsCM',
    )
  },
  estimateSize: _foodListCMEstimateSize,
  serialize: _foodListCMSerialize,
  deserialize: _foodListCMDeserialize,
  deserializeProp: _foodListCMDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'FoodStaticticsCM': FoodStaticticsCMSchema},
  getId: _foodListCMGetId,
  getLinks: _foodListCMGetLinks,
  attach: _foodListCMAttach,
  version: '3.1.0+1',
);

int _foodListCMEstimateSize(
  FoodListCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.foods.length * 3;
  {
    final offsets = allOffsets[FoodStaticticsCM]!;
    for (var i = 0; i < object.foods.length; i++) {
      final value = object.foods[i];
      bytesCount +=
          FoodStaticticsCMSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _foodListCMSerialize(
  FoodListCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<FoodStaticticsCM>(
    offsets[0],
    allOffsets,
    FoodStaticticsCMSchema.serialize,
    object.foods,
  );
}

FoodListCM _foodListCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodListCM();
  object.foods = reader.readObjectList<FoodStaticticsCM>(
        offsets[0],
        FoodStaticticsCMSchema.deserialize,
        allOffsets,
        FoodStaticticsCM(),
      ) ??
      [];
  object.id = id;
  return object;
}

P _foodListCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<FoodStaticticsCM>(
            offset,
            FoodStaticticsCMSchema.deserialize,
            allOffsets,
            FoodStaticticsCM(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodListCMGetId(FoodListCM object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodListCMGetLinks(FoodListCM object) {
  return [];
}

void _foodListCMAttach(IsarCollection<dynamic> col, Id id, FoodListCM object) {
  object.id = id;
}

extension FoodListCMQueryWhereSort
    on QueryBuilder<FoodListCM, FoodListCM, QWhere> {
  QueryBuilder<FoodListCM, FoodListCM, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodListCMQueryWhere
    on QueryBuilder<FoodListCM, FoodListCM, QWhereClause> {
  QueryBuilder<FoodListCM, FoodListCM, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FoodListCM, FoodListCM, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterWhereClause> idBetween(
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

extension FoodListCMQueryFilter
    on QueryBuilder<FoodListCM, FoodListCM, QFilterCondition> {
  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition>
      foodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foods',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition> foodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foods',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition>
      foodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foods',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition>
      foodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foods',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition>
      foodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foods',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition>
      foodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition> idBetween(
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

extension FoodListCMQueryObject
    on QueryBuilder<FoodListCM, FoodListCM, QFilterCondition> {
  QueryBuilder<FoodListCM, FoodListCM, QAfterFilterCondition> foodsElement(
      FilterQuery<FoodStaticticsCM> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'foods');
    });
  }
}

extension FoodListCMQueryLinks
    on QueryBuilder<FoodListCM, FoodListCM, QFilterCondition> {}

extension FoodListCMQuerySortBy
    on QueryBuilder<FoodListCM, FoodListCM, QSortBy> {}

extension FoodListCMQuerySortThenBy
    on QueryBuilder<FoodListCM, FoodListCM, QSortThenBy> {
  QueryBuilder<FoodListCM, FoodListCM, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodListCM, FoodListCM, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FoodListCMQueryWhereDistinct
    on QueryBuilder<FoodListCM, FoodListCM, QDistinct> {}

extension FoodListCMQueryProperty
    on QueryBuilder<FoodListCM, FoodListCM, QQueryProperty> {
  QueryBuilder<FoodListCM, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodListCM, List<FoodStaticticsCM>, QQueryOperations>
      foodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foods');
    });
  }
}
