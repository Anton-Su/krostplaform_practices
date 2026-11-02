import 'package:injectable/injectable.dart';
import 'package:practice_1/data/database.dart';
import 'package:practice_1/domain/entities/position.dart';
import 'package:practice_1/domain/repository/position_repository.dart';

@LazySingleton(as: PositionRepository)
class PositionRepositoryImpl implements PositionRepository {
  final AppDatabase _db;

  PositionRepositoryImpl(this._db);

  @override
  Future<List<Position>> getPositions() async {
    final rows = await _db.select(_db.positions).get();
    await Future.delayed(const Duration(milliseconds: 2000));
    return rows.map(toEntity).toList();
  }

  @override
  Future<Position?> getPositionById(int id) async {
    final row = await (_db.select(
      _db.positions,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    await Future.delayed(const Duration(milliseconds: 2000));
    return row == null ? null : toEntity(row);
  }
}
