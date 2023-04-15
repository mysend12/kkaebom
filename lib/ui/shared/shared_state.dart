import 'package:event_hub/event_hub.dart';

class SharedState {
  SharedState(this.eventHub);
  EventHub eventHub;

  int _i = 1;
  int get i => _i;

  setI(int change) {
    _i = change;
    eventHub.fire('test', i);
  }

}