import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitialState(counterValue: 0)) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrementEvent) {
        emit(CounterIncrementState(counterValue: state.counterValue + 1));
      } else if (event is CounterDecrementEvent) {
        if (state.counterValue == 0) return;
        emit(CounterDecrementState(counterValue: state.counterValue - 1));
      } else if (event is CounterResetEvent) {
        emit(const CounterResetState(counterValue: 0));
      }
    });
  }
}
