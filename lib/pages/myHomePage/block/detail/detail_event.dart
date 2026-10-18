part of 'detail_bloc.dart';

@immutable
sealed class DetailEvent {
  const DetailEvent();
}

final class LoadDetail extends DetailEvent {
  final int id;
  const LoadDetail(this.id);
}
