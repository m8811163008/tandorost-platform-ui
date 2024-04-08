// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_of_measurement.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUnitOfMeasurmentCMCollection on Isar {
  IsarCollection<UnitOfMeasurmentCM> get unitOfMeasurmentCMs =>
      this.collection();
}

const UnitOfMeasurmentCMSchema = CollectionSchema(
  name: r'UnitOfMeasurmentCM',
  id: 7100287120228717337,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'howManyGrams': PropertySchema(
      id: 1,
      name: r'howManyGrams',
      type: IsarType.long,
    ),
    r'icon': PropertySchema(
      id: 2,
      name: r'icon',
      type: IsarType.string,
    ),
    r'max': PropertySchema(
      id: 3,
      name: r'max',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _unitOfMeasurmentCMEstimateSize,
  serialize: _unitOfMeasurmentCMSerialize,
  deserialize: _unitOfMeasurmentCMDeserialize,
  deserializeProp: _unitOfMeasurmentCMDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _unitOfMeasurmentCMGetId,
  getLinks: _unitOfMeasurmentCMGetLinks,
  attach: _unitOfMeasurmentCMAttach,
  version: '3.1.0+1',
);

int _unitOfMeasurmentCMEstimateSize(
  UnitOfMeasurmentCM object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.icon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _unitOfMeasurmentCMSerialize(
  UnitOfMeasurmentCM object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeLong(offsets[1], object.howManyGrams);
  writer.writeString(offsets[2], object.icon);
  writer.writeLong(offsets[3], object.max);
  writer.writeString(offsets[4], object.title);
}

UnitOfMeasurmentCM _unitOfMeasurmentCMDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UnitOfMeasurmentCM();
  object.howManyGrams = reader.readLongOrNull(offsets[1]);
  object.icon = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.max = reader.readLongOrNull(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  return object;
}

P _unitOfMeasurmentCMDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _unitOfMeasurmentCMGetId(UnitOfMeasurmentCM object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _unitOfMeasurmentCMGetLinks(
    UnitOfMeasurmentCM object) {
  return [];
}

void _unitOfMeasurmentCMAttach(
    IsarCollection<dynamic> col, Id id, UnitOfMeasurmentCM object) {
  object.id = id;
}

extension UnitOfMeasurmentCMQueryWhereSort
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QWhere> {
  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UnitOfMeasurmentCMQueryWhere
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QWhereClause> {
  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterWhereClause>
      idBetween(
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

extension UnitOfMeasurmentCMQueryFilter
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QFilterCondition> {
  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      howManyGramsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'howManyGrams',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      howManyGramsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'howManyGrams',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      howManyGramsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'howManyGrams',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      howManyGramsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'howManyGrams',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      howManyGramsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'howManyGrams',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      howManyGramsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'howManyGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      maxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'max',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      maxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'max',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      maxEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      maxGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      maxLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max',
        value: value,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      maxBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension UnitOfMeasurmentCMQueryObject
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QFilterCondition> {}

extension UnitOfMeasurmentCMQueryLinks
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QFilterCondition> {}

extension UnitOfMeasurmentCMQuerySortBy
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QSortBy> {
  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByHowManyGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howManyGrams', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByHowManyGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howManyGrams', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension UnitOfMeasurmentCMQuerySortThenBy
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QSortThenBy> {
  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByHowManyGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howManyGrams', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByHowManyGramsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'howManyGrams', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max', Sort.desc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension UnitOfMeasurmentCMQueryWhereDistinct
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QDistinct> {
  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QDistinct>
      distinctByHowManyGrams() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'howManyGrams');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QDistinct>
      distinctByIcon({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QDistinct>
      distinctByMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'max');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension UnitOfMeasurmentCMQueryProperty
    on QueryBuilder<UnitOfMeasurmentCM, UnitOfMeasurmentCM, QQueryProperty> {
  QueryBuilder<UnitOfMeasurmentCM, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, int?, QQueryOperations>
      howManyGramsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'howManyGrams');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, String?, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, int?, QQueryOperations> maxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'max');
    });
  }

  QueryBuilder<UnitOfMeasurmentCM, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
