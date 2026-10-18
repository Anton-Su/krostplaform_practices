import 'package:practice_1/domain/entities/position.dart';

abstract class PositionRepository {
  Future<List<Position>> getPositions();
  Future<Position?> getPositionById(int id);
}