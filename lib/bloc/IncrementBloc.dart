import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example/bloc/IncrementEvent.dart';
import 'package:example/bloc/IncrementState.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  @override
  IncrementState get initialState => Idle();

  @override
  Stream<IncrementState> mapEventToState(IncrementEvent event) async* {
    if (event is IncrementByStepEvent) {
      yield* _mapIncrementByStep(event);
    } else if (event is IncrementedEvent) {
      yield* _mapIncremented(event);
    } else if (event is IdleEvent) {
      yield* _mapIdle(event);
    }
  }

  Stream<IncrementState> _mapIncrementByStep(
      IncrementByStepEvent event) async* {
    print("Incrementing...");
    yield Incrementing(event.counter);
    event.counter.increment(event.step);
    await Future.delayed(Duration(seconds: 3));
    yield Incremented(event.counter);
  }

  Stream<IncrementState> _mapIncremented(IncrementedEvent event) async* {
    print("Incremented");
  }

  Stream<IncrementState> _mapIdle(IdleEvent event) async* {
    yield Idle();
    print("Idle");
  }
}
