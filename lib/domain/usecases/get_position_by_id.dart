import 'package:injectable/injectable.dart';
import 'package:practice_1/domain/entities/position.dart';
import 'package:practice_1/domain/repository/position_repository.dart';

@injectable
class GetPositionById {
  final PositionRepository _repository;

  GetPositionById(this._repository);

  Future<Position?> call(int id) {
    return _repository.getPositionById(id);
  }
}
