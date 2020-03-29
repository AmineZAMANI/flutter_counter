import 'package:equatable/equatable.dart';
import 'package:example/model/Counter.dart';

abstract class IncrementEvent extends Equatable {}

class IncrementByStepEvent extends IncrementEvent {
  final Counter counter;
  final int step;
  IncrementByStepEvent(this.counter, this.step);
  @override
  List<Object> get props => [this.counter, this.step];
}

class IncrementedEvent extends IncrementEvent {
  final Counter counter;
  IncrementedEvent(this.counter);
  @override
  List<Object> get props => [this.counter];
}

class IdleEvent extends IncrementEvent {
  IdleEvent();
  @override
  List<Object> get props => [];
}
