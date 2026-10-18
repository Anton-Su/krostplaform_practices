part of 'my_home_bloc.dart';


// Как экран может выглядеть?


@immutable
sealed class MyHomeState {
  const MyHomeState();
}

// initial: блок только создан
final class MyHomeInitial extends MyHomeState {
  const MyHomeInitial();
}

// loading: идёт загрузка
final class MyHomeLoading extends MyHomeState {
  const MyHomeLoading();
}

// loaded: данные получены
final class MyHomeLoaded extends MyHomeState {
  final List<PositionRow> positions;
  final int counter;
  const MyHomeLoaded({required this.positions, this.counter = 0});
  MyHomeLoaded copyWith({int? counter}) {
    return MyHomeLoaded(positions: positions, counter: counter ?? this.counter);
  }
}

// error: ошибка
final class MyHomeError extends MyHomeState {
  final String message;
  const MyHomeError(this.message);
}
