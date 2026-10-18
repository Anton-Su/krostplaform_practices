import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:practice_1/domain/entities/position.dart';
import 'package:practice_1/domain/usecases/get_position_by_id.dart';

part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetPositionById _getPositionById;

  DetailBloc(this._getPositionById) : super(const DetailLoading()) {
    on<LoadDetail>(_onLoad);
  }

  Future<void> _onLoad(LoadDetail event, Emitter<DetailState> emit) async {
    emit(const DetailLoading());
    try {
      final position = await _getPositionById(event.id);

      if (position == null) {
        emit(const DetailError('Запись не найдена'));
      } else {
        emit(DetailLoaded(position));
      }
    } catch (e) {
      emit(const DetailError('Не удалось загрузить данные'));
    }
  }
}