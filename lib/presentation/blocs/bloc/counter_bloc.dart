import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {

    on<CounterIncremented>(_onCounterIncremented);
    on<CounterDecremented>(_onCounterDecremented);
    on<CounterReset>(_onCounterReset);




    // on<CounterIncremented>((event, emit) {
    //   emit(state.copyWith(
    //     counter: state.counter + event.value,
    //     transactionCount: state.transactionCount + 1,
    //   ));
    // });

    // on<CounterDecremented>((event, emit) {
    //   emit(state.copyWith(
    //     counter: state.counter - event.value,
    //     transactionCount: state.transactionCount + 1,
    //   ));
    // });

    // on<CounterReset>((event, emit) {
    //   emit(state.copyWith(
    //     counter: 0,
    //     transactionCount: state.transactionCount + 1,
    //   ));
    // });
  }

  void _onCounterIncremented(
      CounterIncremented event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterDecremented(
      CounterDecremented event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter - event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: 0,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void increment() {
    add(CounterIncremented(1));
  }

  void decrement() {
    add(CounterDecremented(1));
  }

  void reset() {
    add(CounterReset());
  }

}
