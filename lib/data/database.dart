import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
// Путь до файла, в котором будет сохраняться сгенерированный код
part 'database.g.dart';
@DriftDatabase(tables: [Position]) // Передаем список таблиц
final class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
    driftDatabase(
      name: 'app_database',
    ),
  );
  @override
  int get schemaVersion => 1;
}