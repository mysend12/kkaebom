import 'package:event_hub/event_hub.dart';
import 'package:flutter/material.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/data/shared_state/repository/shared_state_repository.dart';
import 'package:kkaebom/domain/user/use_case/user_use_case.dart';
import 'package:kkaebom/ui/shared/shared_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
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

  void changeColor(BaseColors color) {
    sharedState.changeColor(color);
    sharedStateRepository.save(color);
    notifyListeners();
  }

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
