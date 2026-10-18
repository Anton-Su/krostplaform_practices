import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:practice_1/domain/entities/position.dart';
import 'package:practice_1/domain/usecases/get_positions.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

// Что делать, когда что-то произошло?

@injectable
class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  final GetPositions _getPositions;
  MyHomeBloc(this._getPositions) : super(const MyHomeInitial()) {
    on<LoadPositionsEvent>(_onLoad);
    on<UserTapped>(_onUserTapped);
  }

  Future<void> _onLoad(
      LoadPositionsEvent event,
      Emitter<MyHomeState> emit)
  async {
    emit(const MyHomeLoading());
    try {
      final positions = await _getPositions();
      emit(MyHomeLoaded(positions: positions));
    } catch (e) {
      emit(const MyHomeError('Не удалось загрузить данные'));
    }
  }

  void _onUserTapped(UserTapped event, Emitter<MyHomeState> emit) {
    final current = state;
    if (current is MyHomeLoaded) {
      emit(current.copyWith(counter: current.counter + 1));
    }
  }
}
