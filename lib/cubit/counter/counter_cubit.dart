import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() => emit(CounterIncrement(counter: state.counter + 1));
  void decrement() {
    if (state.counter == 0) return;
    emit(CounterDecrement(counter: state.counter - 1));
  }
  void reset() => emit(CounterReset(counter: 0));
}
