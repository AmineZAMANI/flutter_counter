import 'package:equatable/equatable.dart';
import 'package:example/model/Counter.dart';

abstract class IncrementState extends Equatable {}

class Incremented extends IncrementState {
  final Counter counter;

  Incremented(this.counter);

  @override
  // TODO: implement props
  List<Object> get props => [this.counter];
}

class Incrementing extends IncrementState {
  final Counter counter;

  Incrementing(this.counter);

  @override
  // TODO: implement props
  List<Object> get props => [this.counter];
}

class Idle extends IncrementState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
