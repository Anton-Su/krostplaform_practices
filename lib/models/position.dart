import 'package:drift/drift.dart';

/// Таблица позиций
@DataClassName('PositionRow')
class Positions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get briefDescription => text()();
  TextColumn get description => text()();
  TextColumn get path => text()();
}