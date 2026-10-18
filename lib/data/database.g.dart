// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PositionsTable extends Positions
    with TableInfo<$PositionsTable, PositionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PositionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _briefDescriptionMeta = const VerificationMeta(
    'briefDescription',
  );
  @override
  late final GeneratedColumn<String> briefDescription = GeneratedColumn<String>(
    'brief_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    briefDescription,
    description,
    path,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'positions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PositionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('brief_description')) {
      context.handle(
        _briefDescriptionMeta,
        briefDescription.isAcceptableOrUnknown(
          data['brief_description']!,
          _briefDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_briefDescriptionMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PositionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PositionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      briefDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brief_description'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
    );
  }

  @override
  $PositionsTable createAlias(String alias) {
    return $PositionsTable(attachedDatabase, alias);
  }
}

class PositionRow extends DataClass implements Insertable<PositionRow> {
  final int id;
  final String briefDescription;
  final String description;
  final String path;
  const PositionRow({
    required this.id,
    required this.briefDescription,
    required this.description,
    required this.path,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['brief_description'] = Variable<String>(briefDescription);
    map['description'] = Variable<String>(description);
    map['path'] = Variable<String>(path);
    return map;
  }

  PositionsCompanion toCompanion(bool nullToAbsent) {
    return PositionsCompanion(
      id: Value(id),
      briefDescription: Value(briefDescription),
      description: Value(description),
      path: Value(path),
    );
  }

  factory PositionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PositionRow(
      id: serializer.fromJson<int>(json['id']),
      briefDescription: serializer.fromJson<String>(json['briefDescription']),
      description: serializer.fromJson<String>(json['description']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'briefDescription': serializer.toJson<String>(briefDescription),
      'description': serializer.toJson<String>(description),
      'path': serializer.toJson<String>(path),
    };
  }

  PositionRow copyWith({
    int? id,
    String? briefDescription,
    String? description,
    String? path,
  }) => PositionRow(
    id: id ?? this.id,
    briefDescription: briefDescription ?? this.briefDescription,
    description: description ?? this.description,
    path: path ?? this.path,
  );
  PositionRow copyWithCompanion(PositionsCompanion data) {
    return PositionRow(
      id: data.id.present ? data.id.value : this.id,
      briefDescription: data.briefDescription.present
          ? data.briefDescription.value
          : this.briefDescription,
      description: data.description.present
          ? data.description.value
          : this.description,
      path: data.path.present ? data.path.value : this.path,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PositionRow(')
          ..write('id: $id, ')
          ..write('briefDescription: $briefDescription, ')
          ..write('description: $description, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, briefDescription, description, path);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PositionRow &&
          other.id == this.id &&
          other.briefDescription == this.briefDescription &&
          other.description == this.description &&
          other.path == this.path);
}

class PositionsCompanion extends UpdateCompanion<PositionRow> {
  final Value<int> id;
  final Value<String> briefDescription;
  final Value<String> description;
  final Value<String> path;
  const PositionsCompanion({
    this.id = const Value.absent(),
    this.briefDescription = const Value.absent(),
    this.description = const Value.absent(),
    this.path = const Value.absent(),
  });
  PositionsCompanion.insert({
    this.id = const Value.absent(),
    required String briefDescription,
    required String description,
    required String path,
  }) : briefDescription = Value(briefDescription),
       description = Value(description),
       path = Value(path);
  static Insertable<PositionRow> custom({
    Expression<int>? id,
    Expression<String>? briefDescription,
    Expression<String>? description,
    Expression<String>? path,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (briefDescription != null) 'brief_description': briefDescription,
      if (description != null) 'description': description,
      if (path != null) 'path': path,
    });
  }

  PositionsCompanion copyWith({
    Value<int>? id,
    Value<String>? briefDescription,
    Value<String>? description,
    Value<String>? path,
  }) {
    return PositionsCompanion(
      id: id ?? this.id,
      briefDescription: briefDescription ?? this.briefDescription,
      description: description ?? this.description,
      path: path ?? this.path,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (briefDescription.present) {
      map['brief_description'] = Variable<String>(briefDescription.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PositionsCompanion(')
          ..write('id: $id, ')
          ..write('briefDescription: $briefDescription, ')
          ..write('description: $description, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PositionsTable positions = $PositionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [positions];
}

typedef $$PositionsTableCreateCompanionBuilder = PositionsCompanion Function({
  Value<int> id,
  required String briefDescription,
  required String description,
  required String path,
});
typedef $$PositionsTableUpdateCompanionBuilder = PositionsCompanion Function({
  Value<int> id,
  Value<String> briefDescription,
  Value<String> description,
  Value<String> path,
});

class $$PositionsTableFilterComposer
    extends Composer<_$AppDatabase, $PositionsTable> {
  $$PositionsTableFilterComposer({
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

  ColumnFilters<String> get briefDescription => $composableBuilder(
    column: $table.briefDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PositionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PositionsTable> {
  $$PositionsTableOrderingComposer({
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

  ColumnOrderings<String> get briefDescription => $composableBuilder(
    column: $table.briefDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PositionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PositionsTable> {
  $$PositionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get briefDescription => $composableBuilder(
    column: $table.briefDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);
}

class $$PositionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PositionsTable,
          PositionRow,
          $$PositionsTableFilterComposer,
          $$PositionsTableOrderingComposer,
          $$PositionsTableAnnotationComposer,
          $$PositionsTableCreateCompanionBuilder,
          $$PositionsTableUpdateCompanionBuilder,
          (
            PositionRow,
            BaseReferences<_$AppDatabase, $PositionsTable, PositionRow>,
          ),
          PositionRow,
          PrefetchHooks Function()
        > {
  $$PositionsTableTableManager(_$AppDatabase db, $PositionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PositionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PositionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PositionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> briefDescription = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> path = const Value.absent(),
              }) => PositionsCompanion(
                id: id,
                briefDescription: briefDescription,
                description: description,
                path: path,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String briefDescription,
                required String description,
                required String path,
              }) => PositionsCompanion.insert(
                id: id,
                briefDescription: briefDescription,
                description: description,
                path: path,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PositionsTable, PositionRow>(table),
                  BaseReferences<_$AppDatabase, $PositionsTable, PositionRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PositionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PositionsTable,
      PositionRow,
      $$PositionsTableFilterComposer,
      $$PositionsTableOrderingComposer,
      $$PositionsTableAnnotationComposer,
      $$PositionsTableCreateCompanionBuilder,
      $$PositionsTableUpdateCompanionBuilder,
      (
        PositionRow,
        BaseReferences<_$AppDatabase, $PositionsTable, PositionRow>,
      ),
      PositionRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PositionsTableTableManager get positions =>
      $$PositionsTableTableManager(_db, _db.positions);
}
