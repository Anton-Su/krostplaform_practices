import 'package:practice_1/models/position.dart';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

part 'position_database.g.dart';

/// Таблица позиций
@DataClassName('PositionRow')
class Positions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get briefDescription => text()();
  TextColumn get description => text()();
  TextColumn get path => text()();
}

/// Drift-база
@lazySingleton
@DriftDatabase(tables: [Positions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// Стратегия миграций и первичное заполнение
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      await batch((batch) {
        batch.insertAll(positions, [
          PositionsCompanion.insert(
            briefDescription: 'Заказать обувь',
            description: 'Оформите заказ на обувь в несколько кликов: выберите модель, '
                'подходящий размер и цвет, а также способ доставки. Мы предложим '
                'варианты на любой сезон и бюджет, поможем подобрать пару под ваш стиль.',
            path: 'assets/images/about all.png',
          ),
          PositionsCompanion.insert(
            briefDescription: 'Заказать игры',
            description: 'Выбирайте и заказывайте игры для любых платформ — от новинок '
                'до проверенной классики. Быстрое оформление, удобные способы оплаты '
                'и мгновенный доступ к любимым проектам без лишних хлопот.',
            path: 'assets/images/about family.png',
          ),
          PositionsCompanion.insert(
            briefDescription: 'Стать продавцом',
            description: 'Начните свой путь в продажах: зарегистрируйтесь как продавец, '
                'разместите свои товары и получите доступ к инструментам управления '
                'заказами, аналитике и продвижению вашей продукции.',
            path: 'assets/images/about high-tech.png',
          ),
          PositionsCompanion.insert(
            briefDescription: 'Продавать много и выгодно',
            description: 'Увеличьте свою прибыль с помощью эффективных инструментов '
                'продаж: акции, скидки, персональные предложения и продвижение товаров '
                'помогут вам находить больше покупателей и заключать больше сделок.',
            path: 'assets/images/about home.png',
          ),
          PositionsCompanion.insert(
            briefDescription: 'Стать красавчиком',
            description: 'Прокачайте свой стиль и уверенность в себе: подберите образ, '
                'следуйте актуальным трендам и получайте рекомендации, которые помогут '
                'вам выглядеть и чувствовать себя на все сто.',
            path: 'assets/images/about study.png',
          ),
        ]);
      });
    },
  );
}

/// Функция открытия соединения (для Flutter)
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(
      name: 'positions_drift',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  });
}