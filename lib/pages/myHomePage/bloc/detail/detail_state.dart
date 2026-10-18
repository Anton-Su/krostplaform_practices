part of 'detail_bloc.dart';


@immutable
sealed class DetailState {
  const DetailState();
}

final class DetailLoading extends DetailState {
  const DetailLoading();
}

final class DetailLoaded extends DetailState {
  final Position position;
  const DetailLoaded(this.position);
}

final class DetailError extends DetailState {
  final String message;
  const DetailError(this.message);
}