// this file contains all the event which would be added to emit the corresponding
// states.

abstract class InternetEvent {}

// this class is used to make the connection between following classes.
// we also have declared this abstract class such that when we need to add the
// event type in bloc file we can write just this parent abstract class, rather
// than having to add all the event type ( not possible )

// cannot instantiate abstract classes
class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
