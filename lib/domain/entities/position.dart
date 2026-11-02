import 'package:practice_1/data/database.dart';

class Position {
  final int id;
  final String briefDescription;
  final String description;
  final String path;

  const Position({
    required this.id,
    required this.briefDescription,
    required this.description,
    required this.path,
  });
}

Position toEntity(PositionRow row) => Position(
  id: row.id,
  briefDescription: row.briefDescription,
  description: row.description,
  path: row.path,
);