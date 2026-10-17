import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_home_event.dart';
part 'my_home_state.dart';

class MyHomeBloc extends Bloc<MyHomeEvent, MyHomeState> {
  MyHomeBloc() : super(MyHomeInitial()) {
    on<MyHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
