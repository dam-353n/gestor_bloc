part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}


class CounterIncremented extends CounterEvent {
  final int value;
  const CounterIncremented(this.value);
}

class CounterDecremented extends CounterEvent {
  final int value;
  const CounterDecremented(this.value);
}

class CounterReset extends CounterEvent {}