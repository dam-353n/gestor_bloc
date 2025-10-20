import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void increment() {
    emit(state.copyWith(
      counter: state.counter + 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void decrement() {
    emit(state.copyWith(
      counter: state.counter - 1,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {
    emit(state.copyWith(
      counter: 0,
      transactionCount: state.transactionCount + 1,
    ));
  }
}
