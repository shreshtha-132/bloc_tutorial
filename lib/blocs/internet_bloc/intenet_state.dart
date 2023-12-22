// this file contains all the state which we need to emit corresponding to particular
// events.

abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainedState extends InternetState {}

class InternetLostState extends InternetState {}
