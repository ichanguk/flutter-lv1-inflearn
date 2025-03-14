// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  @override
  List<GeneratedColumn> get $columns => [id, color, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      color:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}color'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int id;
  final String color;
  final DateTime createdAt;
  const CategoryTableData({
    required this.id,
    required this.color,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['color'] = Variable<String>(color);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      id: Value(id),
      color: Value(color),
      createdAt: Value(createdAt),
    );
  }

  factory CategoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      id: serializer.fromJson<int>(json['id']),
      color: serializer.fromJson<String>(json['color']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'color': serializer.toJson<String>(color),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CategoryTableData copyWith({int? id, String? color, DateTime? createdAt}) =>
      CategoryTableData(
        id: id ?? this.id,
        color: color ?? this.color,
        createdAt: createdAt ?? this.createdAt,
      );
  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      id: data.id.present ? data.id.value : this.id,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('id: $id, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, color, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.id == this.id &&
          other.color == this.color &&
          other.createdAt == this.createdAt);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> id;
  final Value<String> color;
  final Value<DateTime> createdAt;
  const CategoryTableCompanion({
    this.id = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.id = const Value.absent(),
    required String color,
    this.createdAt = const Value.absent(),
  }) : color = Value(color);
  static Insertable<CategoryTableData> custom({
    Expression<int>? id,
    Expression<String>? color,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CategoryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? color,
    Value<DateTime>? createdAt,
  }) {
    return CategoryTableCompanion(
      id: id ?? this.id,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('id: $id, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ScheduleTableTable extends ScheduleTable
    with TableInfo<$ScheduleTableTable, ScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorIdMeta = const VerificationMeta(
    'colorId',
  );
  @override
  late final GeneratedColumn<int> colorId = GeneratedColumn<int>(
    'color_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES category_table (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().toUtc(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startTime,
    endTime,
    content,
    date,
    colorId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduleTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('color_id')) {
      context.handle(
        _colorIdMeta,
        colorId.isAcceptableOrUnknown(data['color_id']!, _colorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_colorIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      startTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}start_time'],
          )!,
      endTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}end_time'],
          )!,
      content:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}content'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      colorId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}color_id'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $ScheduleTableTable createAlias(String alias) {
    return $ScheduleTableTable(attachedDatabase, alias);
  }
}

class ScheduleTableData extends DataClass
    implements Insertable<ScheduleTableData> {
  /// 1) 식별 가능한 ID
  final int id;

  /// 2) 시작 시간
  final int startTime;

  /// 3) 종료 시간
  final int endTime;

  /// 4) 일정 내용
  final String content;

  /// 5) 날짜
  final DateTime date;

  /// 6) 카테고리
  final int colorId;

  /// 7) 일정 생성 날짜 시간
  final DateTime createdAt;
  const ScheduleTableData({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.date,
    required this.colorId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['color_id'] = Variable<int>(colorId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTableCompanion(
      id: Value(id),
      startTime: Value(startTime),
      endTime: Value(endTime),
      content: Value(content),
      date: Value(date),
      colorId: Value(colorId),
      createdAt: Value(createdAt),
    );
  }

  factory ScheduleTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleTableData(
      id: serializer.fromJson<int>(json['id']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      colorId: serializer.fromJson<int>(json['colorId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'colorId': serializer.toJson<int>(colorId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ScheduleTableData copyWith({
    int? id,
    int? startTime,
    int? endTime,
    String? content,
    DateTime? date,
    int? colorId,
    DateTime? createdAt,
  }) => ScheduleTableData(
    id: id ?? this.id,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    content: content ?? this.content,
    date: date ?? this.date,
    colorId: colorId ?? this.colorId,
    createdAt: createdAt ?? this.createdAt,
  );
  ScheduleTableData copyWithCompanion(ScheduleTableCompanion data) {
    return ScheduleTableData(
      id: data.id.present ? data.id.value : this.id,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      content: data.content.present ? data.content.value : this.content,
      date: data.date.present ? data.date.value : this.date,
      colorId: data.colorId.present ? data.colorId.value : this.colorId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableData(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('colorId: $colorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, startTime, endTime, content, date, colorId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleTableData &&
          other.id == this.id &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.content == this.content &&
          other.date == this.date &&
          other.colorId == this.colorId &&
          other.createdAt == this.createdAt);
}

class ScheduleTableCompanion extends UpdateCompanion<ScheduleTableData> {
  final Value<int> id;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<int> colorId;
  final Value<DateTime> createdAt;
  const ScheduleTableCompanion({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.colorId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScheduleTableCompanion.insert({
    this.id = const Value.absent(),
    required int startTime,
    required int endTime,
    required String content,
    required DateTime date,
    required int colorId,
    this.createdAt = const Value.absent(),
  }) : startTime = Value(startTime),
       endTime = Value(endTime),
       content = Value(content),
       date = Value(date),
       colorId = Value(colorId);
  static Insertable<ScheduleTableData> custom({
    Expression<int>? id,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<int>? colorId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (colorId != null) 'color_id': colorId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScheduleTableCompanion copyWith({
    Value<int>? id,
    Value<int>? startTime,
    Value<int>? endTime,
    Value<String>? content,
    Value<DateTime>? date,
    Value<int>? colorId,
    Value<DateTime>? createdAt,
  }) {
    return ScheduleTableCompanion(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      content: content ?? this.content,
      date: date ?? this.date,
      colorId: colorId ?? this.colorId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (colorId.present) {
      map['color_id'] = Variable<int>(colorId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('colorId: $colorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $ScheduleTableTable scheduleTable = $ScheduleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoryTable,
    scheduleTable,
  ];
}

typedef $$CategoryTableTableCreateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      required String color,
      Value<DateTime> createdAt,
    });
typedef $$CategoryTableTableUpdateCompanionBuilder =
    CategoryTableCompanion Function({
      Value<int> id,
      Value<String> color,
      Value<DateTime> createdAt,
    });

final class $$CategoryTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $CategoryTableTable, CategoryTableData> {
  $$CategoryTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ScheduleTableTable, List<ScheduleTableData>>
  _scheduleTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.scheduleTable,
    aliasName: $_aliasNameGenerator(
      db.categoryTable.id,
      db.scheduleTable.colorId,
    ),
  );

  $$ScheduleTableTableProcessedTableManager get scheduleTableRefs {
    final manager = $$ScheduleTableTableTableManager(
      $_db,
      $_db.scheduleTable,
    ).filter((f) => f.colorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scheduleTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> scheduleTableRefs(
    Expression<bool> Function($$ScheduleTableTableFilterComposer f) f,
  ) {
    final $$ScheduleTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleTable,
      getReferencedColumn: (t) => t.colorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTableTableFilterComposer(
            $db: $db,
            $table: $db.scheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> scheduleTableRefs<T extends Object>(
    Expression<T> Function($$ScheduleTableTableAnnotationComposer a) f,
  ) {
    final $$ScheduleTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scheduleTable,
      getReferencedColumn: (t) => t.colorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScheduleTableTableAnnotationComposer(
            $db: $db,
            $table: $db.scheduleTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTableTable,
          CategoryTableData,
          $$CategoryTableTableFilterComposer,
          $$CategoryTableTableOrderingComposer,
          $$CategoryTableTableAnnotationComposer,
          $$CategoryTableTableCreateCompanionBuilder,
          $$CategoryTableTableUpdateCompanionBuilder,
          (CategoryTableData, $$CategoryTableTableReferences),
          CategoryTableData,
          PrefetchHooks Function({bool scheduleTableRefs})
        > {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CategoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CategoryTableCompanion(
                id: id,
                color: color,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String color,
                Value<DateTime> createdAt = const Value.absent(),
              }) => CategoryTableCompanion.insert(
                id: id,
                color: color,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoryTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({scheduleTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (scheduleTableRefs) db.scheduleTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (scheduleTableRefs)
                    await $_getPrefetchedData<
                      CategoryTableData,
                      $CategoryTableTable,
                      ScheduleTableData
                    >(
                      currentTable: table,
                      referencedTable: $$CategoryTableTableReferences
                          ._scheduleTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoryTableTableReferences(
                                db,
                                table,
                                p0,
                              ).scheduleTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.colorId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTableTable,
      CategoryTableData,
      $$CategoryTableTableFilterComposer,
      $$CategoryTableTableOrderingComposer,
      $$CategoryTableTableAnnotationComposer,
      $$CategoryTableTableCreateCompanionBuilder,
      $$CategoryTableTableUpdateCompanionBuilder,
      (CategoryTableData, $$CategoryTableTableReferences),
      CategoryTableData,
      PrefetchHooks Function({bool scheduleTableRefs})
    >;
typedef $$ScheduleTableTableCreateCompanionBuilder =
    ScheduleTableCompanion Function({
      Value<int> id,
      required int startTime,
      required int endTime,
      required String content,
      required DateTime date,
      required int colorId,
      Value<DateTime> createdAt,
    });
typedef $$ScheduleTableTableUpdateCompanionBuilder =
    ScheduleTableCompanion Function({
      Value<int> id,
      Value<int> startTime,
      Value<int> endTime,
      Value<String> content,
      Value<DateTime> date,
      Value<int> colorId,
      Value<DateTime> createdAt,
    });

final class $$ScheduleTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ScheduleTableTable, ScheduleTableData> {
  $$ScheduleTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoryTableTable _colorIdTable(_$AppDatabase db) =>
      db.categoryTable.createAlias(
        $_aliasNameGenerator(db.scheduleTable.colorId, db.categoryTable.id),
      );

  $$CategoryTableTableProcessedTableManager get colorId {
    final $_column = $_itemColumn<int>('color_id')!;

    final manager = $$CategoryTableTableTableManager(
      $_db,
      $_db.categoryTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_colorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ScheduleTableTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoryTableTableFilterComposer get colorId {
    final $$CategoryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colorId,
      referencedTable: $db.categoryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableTableFilterComposer(
            $db: $db,
            $table: $db.categoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoryTableTableOrderingComposer get colorId {
    final $$CategoryTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colorId,
      referencedTable: $db.categoryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableTableOrderingComposer(
            $db: $db,
            $table: $db.categoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<int> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CategoryTableTableAnnotationComposer get colorId {
    final $$CategoryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colorId,
      referencedTable: $db.categoryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.categoryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScheduleTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduleTableTable,
          ScheduleTableData,
          $$ScheduleTableTableFilterComposer,
          $$ScheduleTableTableOrderingComposer,
          $$ScheduleTableTableAnnotationComposer,
          $$ScheduleTableTableCreateCompanionBuilder,
          $$ScheduleTableTableUpdateCompanionBuilder,
          (ScheduleTableData, $$ScheduleTableTableReferences),
          ScheduleTableData,
          PrefetchHooks Function({bool colorId})
        > {
  $$ScheduleTableTableTableManager(_$AppDatabase db, $ScheduleTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ScheduleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ScheduleTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> startTime = const Value.absent(),
                Value<int> endTime = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> colorId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduleTableCompanion(
                id: id,
                startTime: startTime,
                endTime: endTime,
                content: content,
                date: date,
                colorId: colorId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int startTime,
                required int endTime,
                required String content,
                required DateTime date,
                required int colorId,
                Value<DateTime> createdAt = const Value.absent(),
              }) => ScheduleTableCompanion.insert(
                id: id,
                startTime: startTime,
                endTime: endTime,
                content: content,
                date: date,
                colorId: colorId,
                createdAt: createdAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ScheduleTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({colorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (colorId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.colorId,
                            referencedTable: $$ScheduleTableTableReferences
                                ._colorIdTable(db),
                            referencedColumn:
                                $$ScheduleTableTableReferences
                                    ._colorIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ScheduleTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduleTableTable,
      ScheduleTableData,
      $$ScheduleTableTableFilterComposer,
      $$ScheduleTableTableOrderingComposer,
      $$ScheduleTableTableAnnotationComposer,
      $$ScheduleTableTableCreateCompanionBuilder,
      $$ScheduleTableTableUpdateCompanionBuilder,
      (ScheduleTableData, $$ScheduleTableTableReferences),
      ScheduleTableData,
      PrefetchHooks Function({bool colorId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);
  $$ScheduleTableTableTableManager get scheduleTable =>
      $$ScheduleTableTableTableManager(_db, _db.scheduleTable);
}
