part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counterValue;

  const CounterState({required this.counterValue});
}

class CounterInitialState extends CounterState {
  const CounterInitialState({required super.counterValue});
}

class CounterIncrementState extends CounterState {
  const CounterIncrementState({required super.counterValue});
}

class CounterDecrementState extends CounterState {
  const CounterDecrementState({required super.counterValue});
}

class CounterResetState extends CounterState {
  const CounterResetState({required super.counterValue});
}
