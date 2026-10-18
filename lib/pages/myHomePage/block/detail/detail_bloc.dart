import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:practice_1/data/database.dart';

part 'detail_event.dart';
part 'detail_state.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final AppDatabase _db;

  DetailBloc(this._db) : super(const DetailLoading()) {
    on<LoadDetail>(_onLoad);
  }

  Future<void> _onLoad(LoadDetail event, Emitter<DetailState> emit) async {
    emit(const DetailLoading());
    try {
      final position = await (_db.select(_db.positions)
        ..where((t) => t.id.equals(event.id)))
          .getSingleOrNull();

      if (position == null) {
        emit(const DetailError('Запись не найдена'));
      } else {
        await Future.delayed(const Duration(milliseconds: 2000));
        emit(DetailLoaded(position));
      }
    } catch (e) {
      emit(const DetailError('Не удалось загрузить данные'));
    }
  }
}