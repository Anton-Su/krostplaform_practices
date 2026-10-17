import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practice_1/mock/mo%D1%81kDataBase.dart';
import 'package:practice_1/models/position.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

// Что делать, когда что-то произошло?


class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  MyHomeBloc() : super(const MyHomeInitial()) {
    on<LoadPositionsEvent>(_onLoad);
    on<UserTapped>(_onUserTapped);
  }
  Future<void> _onLoad(
      LoadPositionsEvent event,
      Emitter<MyHomeState> emit)
  async {
    emit(const MyHomeLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
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
