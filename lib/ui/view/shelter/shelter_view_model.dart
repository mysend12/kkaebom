import 'package:event_hub/event_hub.dart';
import 'package:flutter/material.dart';

import '../../../data/shared_state/repository/shared_state_repository.dart';
import '../../../domain/user/use_case/user_use_case.dart';
import '../../shared/shared_state.dart';

class ShelterViewModel extends ChangeNotifier {
  ShelterViewModel({
    required this.sharedStateRepository,
    required this.userUseCase,
    required this.sharedState,
    required this.eventHub,
  }) {
    _setEvent();
  }

  final SharedStateRepository sharedStateRepository;
  final UserUseCase userUseCase;
  final SharedState sharedState;
  final EventHub eventHub;

  void _setEvent() {
    eventHub.on('test', (event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
