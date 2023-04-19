import 'package:event_hub/event_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:kkaebom/data/shared_state/model/base_colors.dart';
import 'package:kkaebom/data/shared_state/repository/shared_state_repository.dart';
import 'package:kkaebom/ui/shared/shared_state.dart';

class SharedViewModel extends ChangeNotifier {
  SharedViewModel({
    required this.sharedStateRepository,
    required this.sharedState,
    required this.eventHub,
  }) {
    _setEvent();
  }
  final SharedStateRepository sharedStateRepository;
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

  void changeBottomNavigationIndex(int index) {
    sharedState.setBottomNavigationIndex(index);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
