import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterIncrement) {
                  return counterObserve(state.counter.toString(), Colors.green);
                } else if (state is CounterDecrement) {
                  return counterObserve(state.counter.toString(), Colors.red);
                } else if (state is CounterReset) {
                  return counterObserve(state.counter.toString(), Colors.black);
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
                onPressed: () => context.read<CounterCubit>().increment(),
                child: const Icon(Icons.add, color: Colors.green),
              ),
              MaterialButton(
                onPressed: () => context.read<CounterCubit>().reset(),
                child: const Icon(Icons.stop),
              ),
              MaterialButton(
                onPressed: () => context.read<CounterCubit>().decrement(),
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
