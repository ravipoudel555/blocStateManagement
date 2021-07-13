import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/constants/enums.dart';

import 'package:bloc_flutter/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false)) {
    //any cubit.listen() is depricated instead stream.listen() should be used.
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
