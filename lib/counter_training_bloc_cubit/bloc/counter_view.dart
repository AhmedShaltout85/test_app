import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/counter_training_bloc_cubit/bloc/counter_bloc.dart';


class CounterBolcView extends StatelessWidget {
  const CounterBolcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterIncrementState) {
                  return counterObserve(state.counterValue.toString(), Colors.green);
                } else if (state is CounterDecrementState) {
                  return counterObserve(state.counterValue.toString(), Colors.red);
                } else if (state is CounterResetState) {
                  return counterObserve(state.counterValue.toString(), Colors.black);
                } else {
                  return counterObserve('0', Colors.black);
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                child: const Icon(Icons.add, color: Colors.green),
              ),
              MaterialButton(
                onPressed: () => context.read<CounterBloc>().add(CounterResetEvent()),
                child: const Icon(Icons.stop),
              ),
              MaterialButton(
                onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
                child: const Icon(Icons.remove, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget counterObserve(String counterStringValue, Color color) {
    return Text(
      counterStringValue,
      style: TextStyle(
        fontSize: 24,
        color: color,
      ),
    );
  }
}
