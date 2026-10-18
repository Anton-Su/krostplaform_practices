import 'package:injectable/injectable.dart';
import 'package:practice_1/domain/entities/position.dart';
import 'package:practice_1/domain/repository/position_repository.dart';

@injectable
class GetPositions {
  final PositionRepository _repository;

  GetPositions(this._repository);

  Future<List<Position>> call() {
    return _repository.getPositions();
  }
}
