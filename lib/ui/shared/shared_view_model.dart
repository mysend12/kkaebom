import 'package:event_hub/event_hub.dart';
import 'package:flutter/cupertino.dart';

import '../../data/shared_state/model/base_colors.dart';
import '../../data/shared_state/repository/shared_state_repository.dart';
import 'shared_state.dart';

class SharedViewModel extends ChangeNotifier {
  SharedViewModel({
    required this.sharedStateRepository,
    required sharedState,
    required this.eventHub,
  }) : _sharedState = sharedState {
    _setEvent();
  }
  final SharedStateRepository sharedStateRepository;
  final SharedState _sharedState;
  final EventHub eventHub;

  SharedState get sharedState => _sharedState;

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

  void changeBottomNavigationIndex(int index) {
    sharedState.setBottomNavigationIndex(index);
    notifyListeners();
  }

  void setKeyboardHeight(double keyboardHeight) {
    _sharedState.setKeyboardHeight(keyboardHeight);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
