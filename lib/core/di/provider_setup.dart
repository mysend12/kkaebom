import 'package:event_hub/event_hub.dart';
import 'package:kkaebom/data/platform/database_open_connector.dart';
import 'package:kkaebom/data/platform/database_open_connector_impl.dart'
  if (dart.library.io) 'package:kkaebom/data/platform/mobile_database_open_connector.dart'
  if (dart.library.html) 'package:kkaebom/data/platform/web_database_open_connector.dart';
import 'package:kkaebom/data/user/model/user_database.dart';
import 'package:kkaebom/data/user/repository/user_repository.dart';
import 'package:kkaebom/domain/user/use_case/user_use_case.dart';

import 'package:kkaebom/ui/shared/shared_state.dart';
import 'package:kkaebom/ui/view/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  EventHub eventHub = EventHub();
  SharedState sharedState = SharedState(eventHub);

  DatabaseOpenConnector connector = DatabaseOpenConnectorImpl();

  UserRepository userRepository = UserRepository(UserDatabase(connector));
  UserUseCase userUseCase = UserUseCase(userRepository);

  HomeViewModel homeViewModel = HomeViewModel(
    userUseCase: userUseCase,
    sharedState: sharedState,
    eventHub: eventHub,
  );

  return [
    ChangeNotifierProvider(create: (_) => homeViewModel),
  ];
}
