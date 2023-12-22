// this file would map the events with the states.

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'internet_event.dart';
import 'intenet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>
// this extends the bloc class
// also we need to give the type of event and state within <>
{
  // making the connectivity
  Connectivity _connectivity = Connectivity();
  // we need to end the listener to connectivity after the bloc ends
  // otherwise it may affect the performance because it'd keep running in the bg.
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    // intialise with initial state
    //adding the lost event and the lost state to be emitted
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    //adding the gained event and the gained state to be emitted
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    // adding lister to connectivity and checking if connected

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        // adding the gained event if connected to internet
        add(InternetGainedEvent());
      } else {
        // adding the lost event if not connected to internet
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
