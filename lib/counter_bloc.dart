import 'dart:async';
import 'dart:math';

import 'package:bloc_pattan/counter_event.dart';

class CounterBloc{

  int _counter=0;

  final _counterStateController =StreamController<int>();

  //input
  StreamSink<int> get _incounter => _counterStateController.sink;

  //output
  Stream<int> get counter => _counterStateController.stream;

   final _countEventController=StreamController<CountEvent>();

  Sink<CountEvent> get countEventSink => _countEventController.sink;


  CounterBloc(){
    _countEventController.stream.listen(mapEventToState);
  }

void mapEventToState(CountEvent event) {
  if (event is IncrementEvent) {
    _counter++;
  }else{
    _counter--;
  }
  _incounter.add(_counter);
}

}