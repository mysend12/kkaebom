import 'package:event_hub/event_hub.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/domain/user/use_case/user_use_case.dart';
import 'package:kkaebom/ui/shared/shared_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.userUseCase,
    required this.sharedState,
    required this.eventHub,
  }) {
    _setEvent();
  }

  final UserUseCase userUseCase;
  final SharedState sharedState;
  final EventHub eventHub;

  String _test = '';
  String get test => _test;

  void _setEvent() {
    eventHub.on('test', (event) {
      _test = 'i: ${sharedState.i}';
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
