part of 'my_home_bloc.dart';

// Что может произойти на экране?


@immutable
sealed class MyHomeEvent {
  const MyHomeEvent();
}


final class LoadPositionsEvent extends MyHomeEvent {
  const LoadPositionsEvent();
}


final class UserTapped extends MyHomeEvent {
  const UserTapped();
}