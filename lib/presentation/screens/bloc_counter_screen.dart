
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestor_bloc/presentation/blocs/bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _body(),
    );
  }
}

class _body extends StatelessWidget {
  const _body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) => Text('Bloc Counter: ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().reset(), 
            icon: const Icon( Icons.refresh_outlined )
          )
        ],
      ),

      body: Center(
        child: context.select((CounterBloc counterBloc) {
          print('Rebuilding Text BlocCounterScreen');
          return Text('Counter Value: ${counterBloc.state.counter}', style: const TextStyle(fontSize: 24),);
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().increment(),
            heroTag: 'increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().decrement(),
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().reset(),
            heroTag: 'reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}